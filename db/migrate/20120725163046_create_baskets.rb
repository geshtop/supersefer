class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
   			t.integer  :book_id
   			t.string :session_id
   			t.integer :quantity
   			t.date :added_at
   			t.date :update_at
      t.timestamps
    end
  end
end
