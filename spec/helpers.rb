module Helpers
  def post_peep(message)
    visit '/peeps/new'
    fill_in :message, with: message
    click_button 'Submit'
  end

  def sign_up
    visit '/users/new'
    fill_in :username, with: "tom"
    fill_in :email, with: "tom@test.com"
    fill_in :password, with: "Secret01"
    fill_in :password_confirmation, with: "Secret01"
    click_button "Sign Up"
  end
end
