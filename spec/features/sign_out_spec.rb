feature 'User signs out' do

  before(:each) do
    User.create(email: 'user@example.com',
      username: 'example',
      password: 'secret1234',
      password_confirmation: 'secret1234')
  end

  scenario 'while being signed in' do
    sign_in(email: 'user@example.com', password: 'secret1234')
    click_button 'Sign out'
    expect(page).to have_content "Goodbye!"
    expect(page).not_to have_content "Welcome to Chitter, user@example.com"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
