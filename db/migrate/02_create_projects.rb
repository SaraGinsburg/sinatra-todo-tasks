class CreateProjects < ActiveRecord::Migration[4.2]
  def change
    create_table :projects do |t|
      t.string    :project_name
      t.integer   :user_id

      t.timestamps null: false
    end
  end
end
