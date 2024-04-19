class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.string :room_type
      t.decimal :price_per_night
      t.boolean :availability

      t.timestamps
    end
  end
end
