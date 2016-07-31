module SessionHelpers

  def sign_up(full_name: "Fred Bloggs",
                 user_name: "fredb",
                 email: "fred@bloggs.com",
                 password: "ABC123",
                 password_confirmation: "ABC123")
    visit '/users/new'
    fill_in :full_name, with: full_name
    fill_in :user_name, with: user_name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(user_name:, password:)
    visit '/sessions/new'
    fill_in :user_name, with: user_name
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
