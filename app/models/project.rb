class Project < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :timelogs
  has_many :payments
  has_many :comments, as: :commentable

  before_validation :normalize_title, on: [:create, :update]

  validates :title, :description, :start_date, :deadline, presence: true
  validate :valid_deadline, on: [ :create, :update ]


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
