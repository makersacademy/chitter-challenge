feature 'User Sign-up' do
	scenario 'visitors can sign up as Chitter users' do

    def signup
      visit('/signup')
      fill_in 'username', with: 'cooluser_123'
      fill_in 'email', with: 'cool@me.com'
      fill_in 'password', with: 'secretpassword'
      fill_in 'password_confirmation', with: 'secretpassword'
      click_button 'Sign Up'
    end

		expect { signup }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, cooluser_123')
    expect(User.first.username).to eq('cooluser_123')

  end

  scenario 'passwords must match' do

    def signup_wrong
      visit('/signup')
      fill_in 'username', with: 'cooluser_123'
      fill_in 'email', with: 'cool@me.com'
      fill_in 'password', with: 'secretpassword'
      fill_in 'password_confirmation', with: 'wrongthing'
      click_button 'Sign Up'
    end

    expect { signup_wrong }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password and confirmation password do not match')
  
  end

end