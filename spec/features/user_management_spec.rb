feature 'User Sign Up' do

  def sign_up(name: 'James Hughes',
              email: 'hugjimbo77@gmail.com',
              username: 'JimboOnFire',
              password: '12345678',
              password_confirmation: '12345678')
    visit 'users/new'
      fill_in :name, with: name
      fill_in :email, with: email
      fill_in :username, with: username
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign Up'
    end

    scenario 'I can sign up as a new user' do
      expect { sign_up }.to change(User, :count).by(1)
      expect(page).to have_content('Welcome, hugjimbo77@gmail.com')
      expect(User.first.email).to eq('hugjimbo77@gmail.com')
    end

    scenario 'confirming matching password' do
      expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    end

    scenario 'with a password that does not match' do
      sign_up(password_confirmation: 'wrong')
      expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
      expect(page).to have_content('Password and confirmation password do not match')
    end

    scenario "I can't sign up without an email address" do
      expect { sign_up(email: nil) }.not_to change(User, :count)
    end

    scenario "I can't sign up with an invalid email address" do
      expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    end
end
