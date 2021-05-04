class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients
  has_many :projects
  has_many :timelogs 
  has_many :comments

  before_validation :normalize_text, on: [:create, :update]

 	validates :firstname, :lastname, :email, :contact, :address, :status, :type_of, presence: true
 	validates :firstname, :lastname,  format: { with: /[a-zA-Z]/, message: "should only contain alphabets"}
  validates :contact, telephone_number: {country: proc{:pk}, types: [:mobile, :fixed_line]} 

  enum status: [:disable , :enable]
  enum type_of: [ :manager, :admin, :employee ]

  def make_manager
    if employee?
      manager!modified
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
