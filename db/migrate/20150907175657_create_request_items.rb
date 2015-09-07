class CreateRequestItems < ActiveRecord::Migration
  def change
    create_table :request_items do |t|
      t.integer :request_id
      t.integer :item_id

      t.timestamps
    end
  end
end
