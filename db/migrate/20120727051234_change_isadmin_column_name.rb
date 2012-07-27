class ChangeIsadminColumnName < ActiveRecord::Migration
  def up
  	rename_column(:users, :isadmin , :is_admin)
  end

  def down
  end
end
