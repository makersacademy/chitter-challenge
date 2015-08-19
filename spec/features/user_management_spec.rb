require 'byebug'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up user }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, sam@makersacademy.com')
    expect(User.first.email).to eq('sam@makersacademy.com')
  end

end

feature 'User sign in' do

  scenario 'with correct credentials' do
    # byebug
    user = create(:user)
    password = 'squitecret1234'
    sign_in(user.email, password)
    expect(page).to have_content "Welcome, sam@makersacademy.com"
  end

end


feature 'User signs out' do

  before(:each) do
    user = create(:user)
  end

  scenario 'while being signed in' do
    sign_in('sam@makersacademy.com','squitecret1234')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, sam@makersacademy.com')
  end


end