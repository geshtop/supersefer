class RemoveCategoryidFromBook < ActiveRecord::Migration
  def up
  	remove_column(:books, :category_id)
  end

  def down
  end
end
