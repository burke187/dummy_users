class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true
  def self.authenticate(email, password)

  end
end
