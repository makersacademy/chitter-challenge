feature 'Registration' do
  scenario 'user can sign up for Chitter' do
    visit '/users/new'
    fill_in :email, with: 'test@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Register'

    expect(page).to have_content "Welcome, test@gmail.com!"
  end
end