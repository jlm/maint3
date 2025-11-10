class CreateRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :requests do |t|
      t.text :reqtxt
      t.date :date
      t.string :name
      t.string :company
      t.string :email
      t.string :standard
      t.string :clauseno
      t.string :clausetitle
      t.text :rationale
      t.text :proposal
      t.text :impact
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
