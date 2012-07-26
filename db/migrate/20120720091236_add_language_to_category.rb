class AddLanguageToCategory < ActiveRecord::Migration
  def up
  	add_column(:categories, :language_id, :integer)
  end
  def down
  	remove_column(:categories, :language_id)
  end
end
