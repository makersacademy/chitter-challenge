feature 'User signs out' do
  before(:each) do
    User.create(email: 'test@example.com', password: 'pass',
    password_confirmation: 'pass', user_id: 'reena', user_name: 'Reena Sharma')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@example.com', password: 'pass')
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome, test@example.com'
  end
end
