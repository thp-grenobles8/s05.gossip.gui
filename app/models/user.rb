class User < ApplicationRecord
  attr_accessor :remember_token

  belongs_to :city
  has_many :gossips, foreign_key: 'author_id', class_name: 'Gossip'
  has_many :comments, foreign_key: 'author_id', class_name: 'Comment'
  has_many :send_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :revieved_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage'
  has_many :likes
  has_many :liked_gossips, through: :likes, source: :gossip

  has_secure_password

  validates :first_name, presence: true, length: { minimum: 1 }
  validates :password, presence: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A[^ \t\n\r]+@[^ \t\n\r]+\.[^ \t\n\r]{1,3}\z/,
    message: "Entrez une adresse mail valide !"
  }

  def User.anonymous
    anonymous = User.find_by(
      first_name: 'anonymous',
      last_name: ''
    )
    if !anonymous
      User.create!(
        first_name: 'anonymous',
        last_name: '',
        city: City.all.sample
      )
      return User.find_by(
        first_name: 'anonymous',
        last_name: ''
      ) #pas très DRY mais bon ...
    else
      return anonymous
    end
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute('remember_digest', User.digest(remember_token))
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end
