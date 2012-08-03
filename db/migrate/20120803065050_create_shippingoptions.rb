class CreateShippingoptions < ActiveRecord::Migration
  def change
    create_table :shippingoptions do |t|
    	t.string :title
    	t.integer :shipping_id
    	t.decimal :price
    	t.decimal :from_weight
    	t.decimal :to_weight
      t.timestamps
    end
  end
end
