class RenameBestSellerColumnName < ActiveRecord::Migration
  def up
  	rename_column(:books, :best_selller, :best_seller)
  end

  def down
  end
end
