feature 'Logging out' do

  before(:each) do
    User.create(email: 'david@example.com',
                name: 'David',
                user_name: 'haletothewood',
                password: 'password!',
                password_confirmation: 'password!')
  end

  scenario 'while being signed in' do
    sign_in(email: 'david@example.com', password: 'password!')
    click_button 'Sign Out'
    expect(page).to have_content('Goodbye, and stay healthy!')
    expect(page).not_to have_content('Welcome, david@example.com')
  end

end
