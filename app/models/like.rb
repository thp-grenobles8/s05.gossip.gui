class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gossip

  validate :is_unique

  def is_unique
    if Like.find_by(
      user_id: @user_id,
      gossip_id: @gossip_id
    )
      puts "----------------------DOUBLE LIKE"
      errors.add(“pas de likes en double”)
    end
  end
end
