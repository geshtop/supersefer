class AddWeightColumnToBook < ActiveRecord::Migration
  def change
  	add_column(:books, :weight, :decimal)
  end
end
