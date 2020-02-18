class AddRestaurantsToMoreInfo < ActiveRecord::Migration[6.0]
  def change
    create_table :more_info do |t|

      t.references :restaurants, null: false, foreign_key: true
      t.boolean :cards
      t.boolean :parking
      t.boolean :pets
      t.boolean :all_you_can_eat
      t.boolean :all_you_can_edrink
      t.boolean :tobacco
      t.boolean :free_wifi
      t.boolean :private_room
      t.boolean :party
      t.boolean :takeout
    
    end
  end
end

