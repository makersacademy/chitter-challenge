module FollowHelpers

  def peep_log_out
    sign_up
    log_in("bob89", "password")
    peep("this is a peep")
    click_link "Log out"
  end

  def john_signs_up
    sign_up(username: "john89",
            name: "John",
            email: "john@email.com")
  end

  def follow
    first(".btn-follow").click
  end

  def unfollow
    first(".btn-unfollow").click
  end

end