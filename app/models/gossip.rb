class Gossip < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :join_tag_gossips
  has_many :tags, through: :join_tag_gossips
  has_many :comments
  has_many :likes
  has_many :liking_users, through: :likes, source: :user

  validates :title,
    presence: true,
    length: {minimum: 3, maximum: 30} # , allow_blank: true
  validates :content,
    presence: true
end
