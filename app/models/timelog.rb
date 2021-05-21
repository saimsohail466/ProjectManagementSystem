class Timelog < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :date_of_log, :task_name, :task_description, :working_hours, presence: true
  validate :valid_hours

  private

  def valid_hours
    if working_hours <= 0 
      errors.add(:working_hours, "Should be greater then 0..")
    end
  end
end
