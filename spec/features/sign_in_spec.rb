# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do 
  scenario 'signing up for an account by providing details' do
  	visit 'users/new'
  	fill_in :email, with: 'my_email@email.com'
  	fill_in :name, with: 'Sam Jones'
    fill_in :user_name, with: 'samjones1001'
    fill_in :password, with: 'password'

  	expect{ click_button 'Sign up' }.to change(User,:count).by(1)
  	expect(current_path).to eq '/main'
  	expect(page).to have_content('Welcome to bookmark manager, samjones1001')
  end	
end