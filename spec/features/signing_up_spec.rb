feature 'Users sign up' do

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
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
