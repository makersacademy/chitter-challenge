module Helpers

  def user_sign_up
    visit '/user/new'
    fill_in "email", with: "me@me.com"
    fill_in "name", with: "Ellie W"
    fill_in "username", with: "winnie"
    fill_in "password", with: "pass2017"
    fill_in "password_confirmation", with: "pass2017"
    click_on "Sign up"
  end

  def user_sign_up_diff_email
    visit '/user/new'
    fill_in "email", with: "you@me.com"
    fill_in "name", with: "Ellie W"
    fill_in "username", with: "winnie"
    fill_in "password", with: "pass2017"
    fill_in "password_confirmation", with: "pass2017"
    click_on "Sign up"
  end

  def user_sign_up_diff_username
    visit '/user/new'
    fill_in "email", with: "me@me.com"
    fill_in "name", with: "Ellie W"
    fill_in "username", with: "ewinnie"
    fill_in "password", with: "pass2017"
    fill_in "password_confirmation", with: "pass2017"
    click_on "Sign up"
  end

  def user_sign_up_wrong_password
    visit '/user/new'
    fill_in "email", with: "me@me.com"
    fill_in "name", with: "Ellie W"
    fill_in "username", with: "winnie"
    fill_in "password", with: "pass2017"
    fill_in "password_confirmation", with: "wrong"
    click_on "Sign up"
  end

  def user_sign_up_wrong_email_format
    visit '/user/new'
    fill_in "email", with: "me"
    fill_in "name", with: "Ellie W"
    fill_in "username", with: "winnie"
    fill_in "password", with: "pass2017"
    fill_in "password_confirmation", with: "pass2017"
    click_on "Sign up"
  end

  def user_sign_up_with_nil
    visit '/user/new'
    fill_in "email", with: nil
    fill_in "name", with: "Ellie W"
    fill_in "username", with: nil
    fill_in "password", with: "pass2017"
    fill_in "password_confirmation", with: "pass2017"
    click_on "Sign up"
  end

  def user_sign_in
    visit '/sessions/new'
    fill_in "email", with: "me@me.com"
    fill_in "password", with: "pass2017"
    click_on "Sign in"
  end

  def user_sign_in_wrong_password
    visit '/sessions/new'
    fill_in "email", with: "me@me.com"
    fill_in "password", with: "wrong"
    click_on "Sign in"
  end

  def user_reset_password
    visit("/user/reset_password?token=#{user.password_token}")
    fill_in :password, with: "newpassword"
    fill_in :password_confirmation, with: "newpassword"
    click_button "Submit"
  end

  def user_sign_in_new_password
    fill_in "email", with: "me@me.com"
    fill_in "password", with: "newpassword"
    click_on "Sign in"
  end

  def recover_password
    visit '/user/recover'
    fill_in :email, with: "me@me.com"
    click_on "Submit"
  end

  def add_peep
    visit '/peep/new'
    fill_in "message", with: "If everybody minded their own business, the world would go around a great deal faster than it does."
    click_on "Post peep"
  end

  def add_another_peep
    visit '/peep/new'
    fill_in "message", with: "Why is a raven like a writing-desk?"
    click_on "Post peep"
  end

  def add_yet_another_peep
    visit '/peep/new'
    fill_in "message", with: "If you don't know where you are going any road can take you there."
    click_on "Post peep"
  end
end
