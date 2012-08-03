class AddScaleToPrices < ActiveRecord::Migration
  def change
  	change_column(:books, :price, :decimal, :precision => 8, :scale => 2)
  	change_column(:books, :weight, :decimal,:precision => 8, :scale => 2)
  	change_column(:shippingoptions, :price, :decimal, :precision => 8, :scale => 2)
  	change_column(:shippingoptions, :from_weight, :decimal ,:precision => 8, :scale => 2)
   	change_column(:shippingoptions, :to_weight, :decimal ,:precision => 8, :scale => 2)
   	change_column(:orders, :products_price, :decimal, :precision => 8, :scale => 2)
  	change_column(:orders, :total_weight, :decimal, :precision => 8, :scale => 2)
  	change_column(:orders, :shipping_price, :decimal, :precision => 8, :scale => 2)
  	change_column(:orders, :grandtotal, :decimal, :precision => 8, :scale => 2)

  end
end
