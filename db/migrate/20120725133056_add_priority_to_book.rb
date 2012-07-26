class AddPriorityToBook < ActiveRecord::Migration
  def change
  	add_column(:books, :priority, :integer)
  end
end
