class AddActiveToDelivery < ActiveRecord::Migration
  def change
  	add_column :deliveries, :active, :boolean, default: true
  end
end
