class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      
      t.integer    :postal_code,              null: false
      t.string     :address,                  null: false
      t.integer    :tel,                      null: false
      t.integer    :average_price,            null: false
      t.string     :genre,                    null: false
      t.string     :horiday
      t.string     :drink

      t.timestamps
    end
  end
end
