class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
	t.string :title
	t.integer :status
	t.integer :language_id
      t.timestamps
    end
  end
end
