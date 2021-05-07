class Project < ApplicationRecord
  belongs_to :client
  has_many :timelogs, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  before_validation :normalize_title, on: [:create, :update]

  validates :title, :description, :start_date, :deadline, presence: true
  validate :valid_deadline, on: [:create, :update]


  private

  def normalize_title
    self.title = title.downcase.titleize
    self.description = description.downcase.titleize
  end

  def valid_deadline
    if Date.today > deadline
      errors.add(:deadline, "Deadline should be valid Deadline..")  
    end  
  end
end
