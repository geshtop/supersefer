class AddStatusAndLanguageToShippingoption < ActiveRecord::Migration
  def change
  	add_column(:shippingoptions, :status_id, :integer)
  	add_column(:shippingoptions, :language_id, :integer)
  end
end
