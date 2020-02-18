class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|

      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.time     :start_time
      t.time     :end_time

      t.timestamps
    end
  end
end
