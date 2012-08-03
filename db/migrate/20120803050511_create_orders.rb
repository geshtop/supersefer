class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :user_id
    	t.string :user_email
    	t.string :user_first_name
    	t.string :user_last_name
    	t.string :user_phone
    	t.string :user_idnum
    	t.string :user_address
    	t.string :user_city
    	t.string :user_country
    	t.string :user_zipcode

		t.decimal :products_price
		t.integer :products_count
		t.decimal :total_weight

		t.integer :shipping_id
		t.integer :shippingoption_id
		t.string :shipping_title
		t.string :shippingoption_title
		t.decimal :shipping_price
		t.decimal :grandtotal

    	t.boolean :has_shipping_address
    	t.string :shipping_first_name
    	t.string :shipping_last_name
    	t.string :shipping_phone
    	t.string :shipping_address
    	t.string :shipping_city
    	t.string :shipping_country
    	t.string :shipping_zipcode

		t.integer :status_id
		t.integer :language_id
		t.boolean :complete
		

    	t.string 
      	t.timestamps
    end
  end
end

