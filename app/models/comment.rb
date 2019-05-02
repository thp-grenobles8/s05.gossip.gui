class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :liking_users, through: :likes, class_name: 'User'

  validates :content,
    presence: true,
    length: {minimum: 1, maximum: 160}
end
