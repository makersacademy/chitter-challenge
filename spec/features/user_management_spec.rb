feature 'User sign up' do

  scenario 'I can sign up as a new user' do
  	visit 'users/new'
  	fill_in :email, with: 'natalie@gmail.com'
  	fill_in :password, with: '1234'
  	fill_in :name, with: 'Natalie'
  	fill_in :username, with: 'Natso'
  	click_button 'Sign up'
    expect(page).to have_content 'Hi, Natso'
    expect(User.last.email).to eq('natalie@gmail.com')
  end
  
end