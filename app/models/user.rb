class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
   validates :location, allow_blank: true, length: { maximum: 15 }
  validates :place, allow_blank: true, length: { maximum: 15 }
  has_secure_password
  has_many :microposts
end