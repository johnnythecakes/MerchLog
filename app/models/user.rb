class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :f_name, type: String
  field :l_name, type: String
  field :password_digest, type: String
  field :email, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: Integer
  field :country, type: String
  field :is_active, type: Mongoid::Boolean, default: true

  validates :f_name, :l_name, :password, :email, presence: true

  validates_uniqueness_of :email

  # validates :zip, 

  has_secure_password

  has_many :products

end
