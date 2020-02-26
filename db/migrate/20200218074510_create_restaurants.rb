class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string     :restaurant_name,          null: false
      t.text       :describe,                 null: false
      t.string     :address,                  null: false
      t.integer    :tel, limit: 8,            null: false
      t.integer    :average_price_lunch,      null: false
      t.integer    :average_price_dinner,     null: false
      t.integer    :genre_id,                 null: false
      t.integer    :horiday_id
      
      t.boolean :cards
      t.boolean :parking
      t.boolean :all_you_can_eat
      t.boolean :all_you_can_drink
      t.boolean :tobacco
      t.boolean :free_wifi
      t.boolean :private_room
      t.boolean :party
      t.boolean :takeout
      
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
