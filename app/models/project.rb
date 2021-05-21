class Project < ApplicationRecord
  has_many :timelogs, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :activeprojects
  has_many :users, through: :activeprojects

  belongs_to :client

  before_validation :normalize_title, on: [:create, :update]
  
  validates :title, :description, :start_date, :deadline, presence: true
  validate :valid_deadline


  private

  # def add_member
  #   Activeproject.create(user_id: current_user.id, project_id: id)
  # end

  def normalize_title
    self.title = title.strip.humanize
    self.description = description.strip.humanize
  end

  def valid_deadline
    return if deadline.nil?
    if Date.today > deadline
      errors.add(:deadline, "should be valid Deadline..")
    end
  end
end
