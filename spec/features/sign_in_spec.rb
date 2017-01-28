# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
feature 'sign in' do
	
  let!(:user) do
    User.create(user_name: 'sam',
    			email: 'sam@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'allows sign in with correct details' do
    sign_in(user_name: user.user_name,   password: user.password)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome to Chitter, sam"
  end

  scenario 'does not allow sign in with incorrect details' do
  	sign_in(user_name: user.user_name,   password: 'notmypassword')
    expect(current_path).to eq '/sessions'
    expect(page).not_to have_content "Welcome to Chitter, sam"
  end



  def sign_in(user_name:, password:)
    visit '/sessions/new'
    fill_in :user_name, with: user_name
    fill_in :password, with: password
    click_button 'Sign in'
  end

end