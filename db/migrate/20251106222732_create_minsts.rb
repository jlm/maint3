class CreateMinsts < ActiveRecord::Migration[8.1]
  def change
    create_table :minsts do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
    add_index :minsts, :code
    add_index :minsts, :name
  end
end
