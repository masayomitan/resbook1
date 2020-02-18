class AddRestaurantsToTime < ActiveRecord::Migration[6.0]
  def change
    create_table :times do |t|
    t.references :restaurants, null: false, foreign_key: true
    
    t.time :lunch_open_time
    t.time :lunch_close_time

    t.time :dinner_open__time
    t.time :dinner_close_time
    
    t.time :all__time
    
    end
  end
end
