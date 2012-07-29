class AddSomeUserFields < ActiveRecord::Migration
  def up
  	add_column(:users, :phone, :string)
  	add_column(:users, :idnum, :string)
  	add_column(:users, :address, :string)
  	add_column(:users, :city, :string)
  	add_column(:users, :country, :string)
  	add_column(:users, :zipcode, :string)
  end

  def down
  end
end
