module SessionHelpers

  def signin(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'sign in'
  end

  def signup(username: "AppleMan", password: "apple123", password_confirmation: "apple123", firstname: "Steve", surname: "Bobs", email: "steve@coder.com")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in 'username', with: username
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    fill_in 'firstname', with: firstname
    fill_in 'surname', with: surname
    fill_in 'email', with: email
    click_button 'sign up'
  end

  def posting(post: 'Hello, world!')
    visit '/posts/new'
    fill_in 'post', with: post
    click_button 'post it'
  end

end
