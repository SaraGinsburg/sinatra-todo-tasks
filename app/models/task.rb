class Task < ActiveRecord::Base
  belongs_to :project

  validates :task_name, :description, presence: true
  validates :task_name, uniqueness: true

  validates :project_id, presence: true
end
