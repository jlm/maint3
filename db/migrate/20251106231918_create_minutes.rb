class CreateMinutes < ActiveRecord::Migration[8.1]
  def change
    create_table :minutes do |t|
      t.date :date
      t.text :text
      t.string :status
      t.references :item, null: false, foreign_key: true
      t.references :meeting, null: false, foreign_key: true
      t.references :minst, null: false, foreign_key: true

      t.timestamps
    end
  end
end
