def create_an_account
  visit '/'
  click_button('join chittr')
  fill_in :name, with: 'Alice Wonderland'
  fill_in :email, with: 'alice@lookingglass.com'
  fill_in :handle, with: :that_alice
  fill_in :password, with: 'whiteR@bbit'
  click_button 'join chittr'
end
