class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string  :description
      t.integer :project_id
      t.date    :start_date
      t.date   :end_date
      
      t.timestamps null: false
    end
  end
end
