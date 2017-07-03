module SessionHelpers
  def sign_up(email: "johnsmith@aol.com", firstname: "John", lastname: "Smith", username: "jsmith", password: "password123", password_confirmation: "password123")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :firstname, with: firstname
    fill_in :lastname, with: lastname
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
