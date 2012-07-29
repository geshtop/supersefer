class RenameStatusFieldToStatusId < ActiveRecord::Migration
  def up
  	rename_column(:languages, :status, :status_id)
  	rename_column(:authors, :status, :status_id)
  	rename_column(:books, :status, :status_id)
  	rename_column(:categories, :status, :status_id)
  	rename_column(:subcategories, :status, :status_id)
  end

  def down
  end
end
