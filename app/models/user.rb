# t.string "username", null: false
# t.string "password_digest", null: false # also unique on idx
# t.string "session_token", null: false   # also unique on idx

class User < ApplicationRecord
  before_validation :ensure_session_token

  validates :username, :session_token, presence: true
  validates :password_digest, :presence: {message: "Password can't be blank"}

  validates :session_token, :password_digest, uniqueness: true
  validates :password, length: {minimum: 8, allow_nil: true}
  # allows password to be nil when retrieving from DB



  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    return user if user &&
    Password.new(user.password_digest).is_password?(password)
    nil
  end

  def self.generate_session_token
    # returns 16-digit pseudorandom string when called
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    @session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    @session_token ||= User.generate_session_token
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = Password.create(new_password)
  end


private
  attr_reader :password

end
