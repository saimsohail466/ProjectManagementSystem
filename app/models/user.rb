class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients, dependent: :destroy
  has_many :timelogs, dependent: :destroy 
  has_many :comments, dependent: :destroy 
  has_many :activeprojects
  has_many :projects, through: :activeprojects, dependent: :destroy

  before_validation :normalize_text, on: [:create, :update]

 	validates :firstname, :lastname, :email, :contact, :status, :type_of, :street, :city, :country, presence: true
 	validates :firstname, :lastname,  format: {with: /[a-zA-Z]/, message: "should only contain alphabets"}
  validates :contact, telephone_number: {country: proc{:pk}, types: [:mobile, :fixed_line]} 
  validates :country, :city, format: {with: /[a-zA-Z]/, message: "should only contains alphabets"}

  after_create :send_email_notification

  #enum status: [:disable , :enable]
  enum type_of: [:manager, :admin, :employee]

  def make_manager
    if employee?
      manager!
    end
  end

  def address
    street + " " + city + "," + country 
  end

  def get_clients
    if admin?
      clients = Client.all
    elsif manager?
      clients = self.clients
    end
  end

  def normalize_text
    self.firstname = firstname.downcase.titleize
    self.lastname = lastname.downcase.titleize
  end

  def full_name
    firstname + " " + lastname  
  end 
end
