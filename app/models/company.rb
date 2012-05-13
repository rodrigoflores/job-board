require "digest"

class Company < ActiveRecord::Base
  validates_presence_of :name, :email, :password

  before_save :encrypt_password

  validates_uniqueness_of :email

  attr_accessor :password
  attr_accessible :password, :name, :email

  has_many :job_positions

  def valid_password?(password)
    self.encrypted_password == Digest::SHA2.hexdigest(password + password_salt + "secot")
  end

  def encrypt_password
    generate_salt
    self.encrypted_password = Digest::SHA2.hexdigest(password + password_salt + "secot")
  end

  def generate_salt
    self.password_salt = random_string
  end

  def random_string
    ('a'..'z').to_a.shuffle.join
  end
end
