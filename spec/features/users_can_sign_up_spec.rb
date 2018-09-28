require 'users'

feature 'the user can sign up to chitter' do
  scenario 'from the home page' do
    visit_sign_up_page
    fill_in 'name', with: 'Borace'
    fill_in 'email', with: 'borace@mail.com'
    fill_in 'username', with: 'borace01'
    fill_in 'password', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'You are now signed up to Chitter!'
    users = Users.new
    expect(users.sign_in('borace01', 'password')).to eq true
  end
end
