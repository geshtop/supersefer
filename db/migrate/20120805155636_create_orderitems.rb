class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
    	t.integer  :order_id
    	t.integer :book_id
    	t.string :title
		t.text :body
		t.string :description
		t.decimal :weight , :precision=>8, :scale =>2
		t.integer :author_id
		t.string :author
		t.string :publisher
		t.string :image
		t.decimal :price ,:precision => 8, :scale => 2
		t.integer :quantity
		t.integer :status_id
		t.integer :language_id
      t.timestamps
    end
  end
end
 