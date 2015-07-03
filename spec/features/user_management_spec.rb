feature 'User sign up' do

  scenario 'I can sign up as a new user' do
  	visit 'users/new'
  	fill_in :email, with: 'natalie@gmail.com'
  	fill_in :password, with: 'natso1'
  	click_button 'Sign up'
    expect(page).to have_content 'Hi, natalie@gmail.com'
    expect(User.first.email).to eq('natalie@gmail.com')
  end
end