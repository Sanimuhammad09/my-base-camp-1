class ChangeColumnInProjects < ActiveRecord::Migration[7.0]
  def change
    change_column(:projects, :title, :text)
  end
end
