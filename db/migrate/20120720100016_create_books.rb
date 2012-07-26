class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
	t.string :title
	t.string :body
	t.string :author
	t.string :publisher
	t.integer :subcategory_id
	t.string :thumbnail
	t.string :image
	t.decimal :price
	t.integer :status
	t.integer :language_id
    t.timestamps
    end
  end
end
