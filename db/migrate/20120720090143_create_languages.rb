class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :title
      t.integer :status
      t.timestamps
    end
  end
end
