class User < ApplicationRecord
  belongs_to :city
  has_many :gossips, foreign_key: 'author_id', class_name: 'Gossip'
  has_many :comments, foreign_key: 'author_id', class_name: 'Comment'
  has_many :send_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :revieved_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage'

  has_secure_password

  validates :password, presence: true, length: { minimum: 4 }

  def self.anonymous
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
end
