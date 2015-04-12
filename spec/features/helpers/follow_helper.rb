module FollowHelpers

  def follow
    first(".btn-follow").click
  end

  def unfollow
    first(".btn-unfollow").click
  end

end