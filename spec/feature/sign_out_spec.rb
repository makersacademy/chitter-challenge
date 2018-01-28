feature 'User signs out' do
  before(:each) do
    User.create(email: 'user2@example.com' ,password: 'pass',
    password_confirmation: 'pass')
  end

  scenario 'while being signed in' do
    sign_in(email: 'user2@example.com', password: 'pass')
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome, user2@example.com'
  end
end
