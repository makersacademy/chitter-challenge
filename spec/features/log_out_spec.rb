feature 'User signs out' do

  before(:each) do
    User.create(email: 'pat@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'pat@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).not_to have_content('Welcome, pat@test.com')
  end

end
