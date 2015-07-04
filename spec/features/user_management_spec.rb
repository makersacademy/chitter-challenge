feature 'User sign up' do

  scenario 'can sign up as a new user' do
  	user = build :user
  	sign_up_as(user)
  	expect(page.status_code).to eq 200
    expect(page).to have_content 'Hi, Natso'
    expect(User.first.email).to eq('natalie@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build :user, password: '1235'
  	sign_up_as(user)
  	expect(current_path).to eq ('/users')
  	expect(page).to have_content 'Password does not match'
  end

  scenario 'does not display name if login failed' do
    user = build :user, password: '1235'
    sign_up_as(user)
    expect(page).not_to have_content 'Hi, Natso'
  end

  def sign_up_as(user)
    visit 'users/new'
  	fill_in :email, with: user.email
  	fill_in :password, with: user.password
  	fill_in :password_confirmation, with: user.password_confirmation
  	fill_in :name, with: user.name
  	fill_in :username, with: user.username
  	click_button 'Sign up'
  end

end