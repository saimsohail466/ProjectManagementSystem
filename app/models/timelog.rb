class Timelog < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments, as: :commentable
end
