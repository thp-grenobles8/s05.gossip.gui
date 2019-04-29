class Gossip < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :join_tag_gossips
  has_many :tags, through: :join_tag_gossips
end
