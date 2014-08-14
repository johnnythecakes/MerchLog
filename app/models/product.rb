class Product
  include Mongoid::Document
  # include Mongoid::Attributes::Dynamic 
  field :category, type: String
  field :subcategory, type: String
  field :make, type: String
  field :name, type: String
  field :description, type: String
  field :warranty, type: Mongoid::Boolean, default: false
  field :w_length, type: Float
  field :p_price, type: Float
  field :c_price, type: Float
  field :purchased_on, type: Date

  belongs_to :user
  has_many :photos
end
