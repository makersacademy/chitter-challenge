module UserHelpers

  def signup(name: "User1", username: 'user1', email: "user1@email.com", password: "123456", password_confirmation: "123456")
    visit('/users/new')
    fill_in('name', with: name)
    fill_in('username', with: username)
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    click_button('Register')
  end

end
