feature 'User sign out' do
  before(:each) do
    User.create(name: 'Pete Smith', email: 'pete@example.com', username: 'peteypops', password: 'password123', password_confirmation: 'password123')
  end

  scenario 'while being signed in' do
    sign_in(email: 'pete@example.com', password: 'password123')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, pete@example.com')
  end
end
