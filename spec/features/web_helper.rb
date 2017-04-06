def sign_up_and_post
  visit '/peeps'
  fill_in :email, with 'ruan@email.com'
  fill_in :password, with 's3cr3t'
  fill_in :name, with 'Ruan'
  fill_in :user_name, with 'ruan'
  click_button 'Sign up'
end
