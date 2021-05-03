class Project < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :timelogs
  has_many :payments
  has_many :comments, as: :commentable

  validates :title, :description, :start_date, :deadline, presence: true
  # validate :valid_start_date, on: [ :update, :create ]
  # validate :valid_deadline, on: [ :update, :create ]


  # private

  # def valid_start_date
  #   startDate = Date.new(start_date)
  #   if start_date < Date.today
  #     errors.add(:start_date, "please enter Valid Start date..")
  #   end 
  # end

  # def valid_deadline
  #   dead_line_date = Date.new(deadline)
  #   if dead_line_date < Date.today
  #     errors.add(:deadline, "please enter valid Deadline..")  
  #   end  
  # end 

end
