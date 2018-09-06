class User < ActiveRecord::Base
  has_many :projects
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true

  #make sure that email format is correct
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
