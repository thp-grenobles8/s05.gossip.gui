class User < ApplicationRecord
  belongs_to :city
  has_many :gossips, foreign_key: 'author', class_name: 'Gossip'
  has_many :send_messages, foreign_key: 'sender', class_name: 'PrivateMessage'
  has_many :revieved_messages, foreign_key: 'recipient', class_name: 'PrivateMessage'
end
