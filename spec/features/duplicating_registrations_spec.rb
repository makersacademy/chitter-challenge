feature 'registration' do

  def sign_up(email: 'bkluczynski@gmail.com',
              name: 'Bart',
              username: 'bartklu',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end



  scenario 'does not allow to have a duplicate email while registration' do
  sign_up
  expect { sign_up(email: 'bkluczynski@gmail.com') }.not_to change(User, :count)
end


scenario 'does not allow to have a duplicate username' do
  sign_up
  expect { sign_up(username: 'bartklu') }.not_to change(User, :count)
end

end
