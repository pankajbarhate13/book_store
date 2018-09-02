class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :email, type: String
  field :password_digest, type: String
  field :token, type: String

  index({ token: 1}, { unique: true})

  has_secure_password
  validates_uniqueness_of :email
  # serialize :token
  # serialize :token, Array
  
  def generate_token
    token = SecureRandom.base64(64)
    user = User.where("id = ?", self.id)
    # while User.where("id = ? and token = ?", "#{self.id}", "%#{token}%").present? do
    #   token = SecureRandom.base(64)
    # end
    
    token_object = {token: token, created_at: Time.now.utc, expires_at: 10.days.from_now.utc}
    self.tokens << token_object
    self.save
    token_object
  end

  def has_valid_token?(token)
    self.tokens.each do |stored_token|
      return true if stored_token['token'] == token && stored_token['expires_at'] > Time.now.utc
    end
    false
  end

end
