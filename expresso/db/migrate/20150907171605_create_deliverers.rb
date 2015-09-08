class CreateDeliverers < ActiveRecord::Migration
  def change
    create_table :deliverers do |t|
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
  end
end
