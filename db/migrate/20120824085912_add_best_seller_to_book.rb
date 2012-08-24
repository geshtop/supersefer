class AddBestSellerToBook < ActiveRecord::Migration
  def change
  	add_column(:books, :best_selller, :boolean)
  end
end
