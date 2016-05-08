feature 'User sign up' do

  scenario 'requires a matching confirmation password' do
    def sign_up(email: 'myemail@mail.com',
      password: '123456',
      password_confirmation: '123456')
      visit '/users/new'
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
    end

    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords do not match, please try again'
  end
end
