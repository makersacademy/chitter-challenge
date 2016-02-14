feature 'Users sign up' do

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'user can not sign up with an invalid email' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end

  scenario 'user can not sign up with a taken email address' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
  
  def sign_up(email: 'reiss94@gmail.com',
	      name: 'reiss',
	      user_name: 'reiss94',
	      password: '1234567',
	      password_confirmation: '1234567')

    visit '/users/new'
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :user_name, with: user_name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end
end
