class CreateMeetings < ActiveRecord::Migration[8.1]
  def change
    create_table :meetings do |t|
      t.date :date
      t.string :meetingtype
      t.string :location
      t.string :minutes_url

      t.timestamps
    end
  end
end
