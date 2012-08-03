class ChangeTypeOfBodyBooksAndRemovThmb < ActiveRecord::Migration
  def up
  	change_column :books, :body, :text
  	remove_column :books, :thumbnail
  end

  def down
  end
end
