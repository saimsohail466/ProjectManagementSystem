class Client < ApplicationRecord
  belongs_to :user
  has_many :projects, dependent: :destroy

  validates :firstname, :lastname, :email, presence: true
  validates :firstname, format: { with: /[a-zA-Z]/, message: "Firstname only contains letters" }
  validates :lastname, format: { with: /[a-zA-Z]/, message: "Lastname only contains letters" }

  def set_clients
    if current_user.admin?
      @clients = Client.all
    else
      @clients = current_user.clients
    end
  end
end
