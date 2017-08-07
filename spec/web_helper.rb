def sign_up
  visit '/sign_up'
  fill_in :email, with: 'nandy@email.com'
  fill_in :password, with:'example123'
  click_button 'submit'
end
