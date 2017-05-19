class RenameGrantColumns < ActiveRecord::Migration
  def change
    rename_column :grants, :experiment_id, :grantee_id
    rename_column :grants, :organization_id, :grantor_id
    rename_column :team_memberships, :scientist_id, :member_id
  end
end
