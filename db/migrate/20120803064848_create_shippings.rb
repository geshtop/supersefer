class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
    	t.string :title
    	t.integer :status_id
    	t.integer :language_id
      t.timestamps
    end
  end
end
