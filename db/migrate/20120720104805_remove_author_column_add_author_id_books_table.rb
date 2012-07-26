class RemoveAuthorColumnAddAuthorIdBooksTable < ActiveRecord::Migration
  def up
  	remove_column(:books, :author)
  	add_column(:books, :author_id, :integer)
  end

  def down
  end
end
