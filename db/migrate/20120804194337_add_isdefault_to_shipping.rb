class AddIsdefaultToShipping < ActiveRecord::Migration
  def change
  	add_column(:shippings, :is_default, :boolean)
  end
end
