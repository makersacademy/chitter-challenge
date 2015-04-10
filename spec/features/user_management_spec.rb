feature 'Feature - User Management' do

  def sign_up email = 'sanjsanj@hotmail.com',
              password = 'password', password_confirmation = 'password',
              user_name = 'Sanjay Purswani', user_handle = 'sanjsanj'
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :user_name, with: user_name
    fill_in :user_handle, with: user_handle
    click_button 'Sign up'
  end

  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, sanjsanj@hotmail.com'
    expect(User.first.email).to eq 'sanjsanj@hotmail.com'
    expect(User.first.user_name).to eq 'Sanjay Purswani'
    expect(User.first.user_handle).to eq 'sanjsanj'
  end

  scenario 'User can\'t sign up without password confirmation' do
    expect { sign_up 'a@a.com', 'pass', 'wrong' }.to change(User, :count).by 0
  end

end
