feature 'Users can sign up for a Chitter account' do
	
  scenario 'A user signs up with valid credentials' do
  	visit '/newusers'

    expect { sign_up }.to change(User,:count).by(1)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome to Chitter, Sam Jones'
    expect(User.first.email).to eq 'sam@email.com'

  end

  scenario 'Will not accept mismatched passwords' do
  	visit '/newusers'

    fill_in 'name', with: "Sam Jones!"
    fill_in 'email', with: "sam@email.com"
    fill_in 'user_name', with: "username"
    fill_in 'password', with: 'abc'
    fill_in 'password_confirmation', with: 'def'
    

    expect { click_button 'Sign Up!' }.not_to change(User,:count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'

  end

  scenario 'Will not accept a blank email addresses' do
  	visit '/newusers'

    fill_in 'name', with: "Sam Jones!"
    fill_in 'email', with: ""
    fill_in 'user_name', with: "username"
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    

    expect { click_button 'Sign Up!' }.not_to change(User,:count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end


  scenario 'Will not accept an invalid email addresses' do
  	visit '/newusers'

    fill_in 'name', with: "Sam Jones!"
    fill_in 'email', with: "sam@email"
    fill_in 'user_name', with: "username"
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    

    expect { click_button 'Sign Up!' }.not_to change(User,:count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'Will not accept a duplicate email addresses' do
  	visit '/newusers'

    fill_in 'name', with: "Sam Jones!"
    fill_in 'email', with: "sam@email.com"
    fill_in 'user_name', with: "username"
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button('Sign Up!')
    visit '/newusers'
    fill_in 'name', with: "Sam Jones!"
    fill_in 'email', with: "sam@email.com"
    fill_in 'user_name', with: "username"
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'

    expect { click_button 'Sign Up!' }.not_to change(User,:count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email is already taken'
  end

end