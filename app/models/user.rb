# # #
# # # In the users table, you'll want to store an email, password_digest and
# # session_token. Make sure to add database constraints (require all fields), and
# indices to ensure uniqueness of emails and speed up the lookup by session_token.
# # #
# # # Write methods to deal with the session token: User::generate_session_token,
# # User#reset_session_token! and User#ensure_session_token.
# # # Write a User#password=(password) method which actually sets the password_digest
# # attribute using BCrypt, and a User#is_password?(password) method to check the
# # users' password when they log in.
# # # Be careful setting instance variables in ActiveRecord, you can't just set
# # @password_digest. In #password= use self.password_digest=.
# # # Remember that in the User model, you'll want to use an after_initialize
# # callback to set the session_token before validation if it's not present.
# # # Write a User::find_by_credentials(email, password) method.
# # # Next write a UsersController and SessionsController
  #
  #
  #
  #
  # create_table "users", force: :cascade do |t|
  #   t.string   "email",           null: false
  #   t.string   "password_digest", null: false
  #   t.string   "session_token",   null: false
  #   t.datetime "created_at",      null: falses
  #   t.datetime "updated_at",      null: false
  # end

class User < ApplicationRecord

  validates :email, :password_digest, presence: true
  validates :password_digest, presence: {message: "Password can't be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :session_token, presence: true

  attr_reader :password

  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def self.find_by_credentials
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
