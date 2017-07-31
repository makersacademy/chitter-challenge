feature 'User logs out' do

  let!(:user) do
    User.create(name: 'user',
                user_name: 'user123',
                email_address: 'user@user.com',
                password: 'pasword123',
                password_confirmation: 'pasword123')
  end

  # scenario 'while being signed in' do
  #   log_in(email_address: 'user@user.com', password: 'password123')
  #   click_button 'Log out'
  #   expect(page).to have_content('goodbye!')
  #   expect(page).not_to have_content('Hey there user')
  # end

end
