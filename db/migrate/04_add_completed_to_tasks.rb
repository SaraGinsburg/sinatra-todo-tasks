class AddCompletedToTasks < ActiveRecord::Migration[4.2]
  def change
    add_column :tasks, :completed, :boolean
  end
end
