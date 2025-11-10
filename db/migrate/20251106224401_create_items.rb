class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.string :number
      t.date :date
      t.string :standard
      t.string :clause
      t.text :subject
      t.string :draft
      t.string :latest_status
      t.references :minst, null: false, foreign_key: true

      t.timestamps
    end
    add_index :items, :number
  end
end
