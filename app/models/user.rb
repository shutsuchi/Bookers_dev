class User < ApplicationRecord
  before_save { email.downcase! }

  has_secure_password

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  attachment :profile_image

  has_many :books,
          dependent: :destroy
  validates :name,
          presence: true,
          length: { maximum: 50 }
  validates :introduction,
          length: { maxumum: 500 }
end
