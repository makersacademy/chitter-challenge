

feature 'User sign up' do


  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, pip')
    expect(User.first.email).to eq('pip@example.com')
  end

  scenario ' requires a matching comfirmation password' do
    expect { sign_up(password_confirmation: 'wrong_password')}.not_to change(User, :count)
  end


  def sign_up(email: 'pip@example.com',
              name: 'Philip Clarke',
              username: 'pip',
              password: 'sausages',
              password_confirmation: 'sausages')
      visit '/users/new'
      expect(page.status_code).to eq(200)
      fill_in :name, with: name
      fill_in :username, with: username
      fill_in :email, with:  email
      fill_in :password, with: password
      click_button 'Sign up'
  end
end
