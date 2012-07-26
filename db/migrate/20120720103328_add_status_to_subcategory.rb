class AddStatusToSubcategory < ActiveRecord::Migration
  def up
  	add_column(:subcategories, :status, :integer)
  end
end
