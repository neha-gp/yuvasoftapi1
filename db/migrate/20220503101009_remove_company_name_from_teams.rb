class RemoveCompanyNameFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :company_name, :string
  end
end
