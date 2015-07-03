feature 'User sign up' do

  scenario 'I can sign up as a new user' do
  	visit 'users/new'
  	fill_in :email, with: 'natalie@gmail.com'
  	fill_in :password, with: 'natso1'
  	click_button 'Sign up'
    #expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Hi, natalie@gmail.com'
  end
end