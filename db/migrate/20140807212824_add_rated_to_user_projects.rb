class AddRatedToUserProjects < ActiveRecord::Migration
  def change
    add_column :user_projects, :rated, :boolean
  end
end
