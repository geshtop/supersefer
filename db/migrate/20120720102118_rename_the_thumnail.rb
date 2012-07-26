class RenameTheThumnail < ActiveRecord::Migration
  def up
  	rename_column :books, :thumnail ,:thumbnail
  end

  def down
  end
end
