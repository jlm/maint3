class ItemsController < ApplicationController
  before_action :set_item, except: %i[index new create]
  helper_method :sort_column, :sort_direction
  def index
    @items = Item.order("#{sort_column} #{sort_direction}")
    @items = @items.open if params[:open].present?
    @items = @items.closed if params[:closed].present?
    @items = @items.review if params[:review].present?

    @qualifier = if params[:open].present?
                   "Open"
    elsif params[:closed].present?
                   "Closed"
    elsif params[:review].present?
                   "Review"
    elsif params[:search].present?
                   ""
    else
                   "All"
    end
  end

  def show
    @minutes = @item.minutes.date_valid.joins(:meeting).order(:date, :id)
    @request = @item.request
  end

  def new
    @item = Item.new
    render layout: "modal"
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: "Item successfully added!"
    else
      render :new, status: :unprocessable_entity, layout: "modal"
    end
  end

  def edit
    render layout: "modal"
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "Item successfully updated!"
    else
      render :edit, status: :unprocessable_entity, layout: "modal"
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Item was successfully destroyed."
  end

  private
  def item_params
    params.expect(item: [ :number, :latest_status, :date, :standard ])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # From http://railscasts.com/episodes/228-sortable-table-columns?autoplay=true
  def sort_column
    Item.column_names.include?(params[:sort]) ? params[:sort] : "number"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
