def create_an_account(
            password: 'whiteR@bbit',
            password_confirmation: 'whiteR@bbit')
  visit '/'
  click_button('join chittr')
  fill_in :name, with: 'Alice Wonderland'
  fill_in :email, with: 'alice@lookingglass.com'
  fill_in :handle, with: :that_alice
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'create your chittr account'
end
