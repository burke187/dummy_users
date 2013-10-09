class User < ActiveRecord::Base
  validates_presence_of :name, :password, :email
  validates :email, uniqueness: true
  def self.authenticate(email, password)

  end
end
