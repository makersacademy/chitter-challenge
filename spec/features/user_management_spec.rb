require './spec/factories/user'

feature 'User sign up' do


  scenario 'I can sign up as a new user' do
    user = build :user
    sign_up_as(user)
    click_button 'Sign up'
    expect(page).to have_content('Welcome, dom')
    expect(User.first.email).to eq('dom@example.com')
  end

end
