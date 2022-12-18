class CreateEventDates < ActiveRecord::Migration[7.0]
  def change
    create_table :event_dates do |t|
      t.references :event, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
