class Client < ApplicationRecord
  belongs_to :user
  has_many :projects

  validates :firstname, :lastname, :email, presence: true
  validates :firstname, format: { with: /[a-zA-Z]/, message: "Firstname only contains letters" }
  validates :lastname, format: { with: /[a-zA-Z]/, message: "Lastname only contains letters" }

end
