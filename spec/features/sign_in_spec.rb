# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
feature 'sign in' do
	
  let!(:user) do
    User.create(name: 'sam',
                user_name: 'sam',
    			      email: 'sam@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'allows sign in with correct details' do
    visit '/newsessions'
    fill_in :user_name, with: 'sam'
    fill_in :password, with: 'password'
    click_button 'Sign in'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome to Chitter, sam"
  end

  scenario 'does not allow sign in with incorrect details' do
  	visit '/newsessions'
    fill_in :user_name, with: 'sam'
    fill_in :password, with: 'notmypassword'
    click_button 'Sign in'
    expect(current_path).to eq '/sessions'
    expect(page).not_to have_content "Welcome to Chitter, sam"
  end



end