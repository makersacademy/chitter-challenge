module SessionHelpers

  def sign_up(username: "acsauk",
              name: "Alex Saunders",
              email: "abc@xyz.com",
              password: "abcd",
              password_confirmation: "abcd")

    visit '/users/sign_up' 
    fill_in('username', with: username)
    fill_in('name', with: name)
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    find_button('Sign up').click
  end

  def sign_in(username:, password:)
      visit '/sessions/new'
      fill_in :username, with: username
      fill_in :password, with: password
      click_button 'Sign in'
  end



end
