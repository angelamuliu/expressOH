class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.time :open_time
      t.time :close_time

      t.timestamps
    end
  end
end
