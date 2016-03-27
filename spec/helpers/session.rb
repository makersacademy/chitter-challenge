module SessionHelpers
  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(name: 'Test Test', username: 'Test_test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name,     with: name
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def post_peep(message: 'This is a test')
    visit '/peeps/new'
    fill_in('content', with: message)
    click_button('Post peep!')
  end
end
