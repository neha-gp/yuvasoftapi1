class RemoveSkillsFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :skills, :text
  end
end
