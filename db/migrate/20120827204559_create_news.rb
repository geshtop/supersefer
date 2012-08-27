class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.integer :status_id
      t.integer :language_id
      t.datetime :new_date
      t.datetime :from_date
      t.datetime :to_date
      t.timestamps
    end
  end
end
