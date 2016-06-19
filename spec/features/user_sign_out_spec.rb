feature 'User signs out' do
  before(:each) do
    User.create(email: 'anna@example.com',
                password: 'example',
                password_confirmation: 'example')
  end

  scenario 'while already signed in' do
    sign_in(email: 'anna@example.com', password: 'example')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, anna@example.com')
  end
end
