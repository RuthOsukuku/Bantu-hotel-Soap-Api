class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :room, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.date :check_in_date
      t.integer :number_of_rooms

      t.timestamps
    end
  end
end
