class RemoveAddAtAndUpdateFromBasket < ActiveRecord::Migration
  def up
  	remove_column(:baskets, :added_at)
  	remove_column(:baskets, :update_at)
  end

  def down
  end
end
