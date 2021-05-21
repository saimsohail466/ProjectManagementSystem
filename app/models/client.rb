class Client < ApplicationRecord
  has_many :projects, dependent: :destroy

  belongs_to :user

  validates :firstname, :lastname, :email, :street, :city, :country, presence: true
  validates :firstname, format: {with: /[a-zA-Z]/, message: "should contain letters"}
  validates :lastname, format: {with: /[a-zA-Z]/, message: "should only contain letters"}
  validates :city, :country, format: {with: /[a-zA-Z]/, message: "should contain letters"}
end
