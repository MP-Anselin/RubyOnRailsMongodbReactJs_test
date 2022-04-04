require 'bcrypt'

class User
  include BCrypt
  include Mongoid::Document
  include Mongoid::Timestamps
  field :username, type: String
  field :email, type: String
  field :password_hash, type: String


  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  scope :filter_by_email, -> (email) { where email: email }

  ##
  # Function to decrypt password
  #

  def password
    @password ||= Password.new(password_hash)
  end

  ##
  # Function to encrypt and save the password
  #

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end