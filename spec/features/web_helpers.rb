def sign_in
  visit '/'
  within 'table.sign-in' do
    fill_in 'username', with: 'testusername'
    fill_in 'password', with: 'Password1'
    click_button 'Sign in'
  end
end
