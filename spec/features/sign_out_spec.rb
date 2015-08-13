require './spec/features/login'
feature 'User signs out' do
  include Login
  before(:each) do
    User.create(username: 'faisal',
                email: 'faisal@gmail.com',
                password: 'burgerking',
                password_confirmation: 'burgerking')
  end

  scenario 'while being signed in' do
    sign_in(email: 'faisal@gmail.com', password: 'burgerking')
    click_button 'Sign out'
    expect(page).to have_content('Logged out')
    expect(page).not_to have_content('Welcome, faisal')
  end

end
