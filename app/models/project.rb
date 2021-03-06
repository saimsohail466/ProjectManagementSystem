class Project < ApplicationRecord
  has_many :timelogs, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :activeprojects, dependent: :destroy
  has_many :users, through: :activeprojects, dependent: :destroy
  has_many :attachments, dependent: :destroy
  
  belongs_to :client
  
  validates :title, :description, :start_date, :deadline, presence: true
  validate :valid_deadline


  private

  def valid_deadline
    return if deadline.nil?
    if Date.today > deadline
      errors.add(:deadline, "should be valid Deadline..")
    end
  end
end
