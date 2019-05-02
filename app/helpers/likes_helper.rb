module LikesHelper
  def like_from_user_gossip(user,gossip)
    if user
      Like.find_by(
        user: user,
        gossip: gossip
      )
    else
      false
    end
  end
end
