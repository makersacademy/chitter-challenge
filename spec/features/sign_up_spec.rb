feature 'Users can sign up for a Chitter account' do
	
  scenario 'A user signs up with valid credentials' do
  	visit '/users/new'

    fill_in 'name', with: "Sam Jones!"
    fill_in 'email', with: "sam@email.com"
    fill_in 'user_name', with: "username"
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    

    expect { click_button 'Sign Up!' }.to change(User,:count).by(1)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome to Chitter, username'
    expect(User.first.email).to eq 'sam@email.com'

  end

  scenario 'Will not accept mismatched passwords' do
  	visit '/users/new'

    fill_in 'name', with: "Sam Jones!"
    fill_in 'email', with: "sam@email.com"
    fill_in 'user_name', with: "username"
    fill_in 'password', with: 'abc'
    fill_in 'password_confirmation', with: 'def'
    

    expect { click_button 'Sign Up!' }.not_to change(User,:count)

  end

end