def sign_up_correctly
  visit '/user/new'
  fill_in :name, with: 'catlover'
  fill_in :email, with: 'cat@cats.com'
  fill_in :password, with: 'ilovecats'
  fill_in :password_confirmation, with: 'ilovecats'
  click_button 'Sign up!'
end

def sign_up_incorrectly
  visit '/user/new'
  fill_in :name, with: 'catlover'
  fill_in :email, with: 'cat@cats.com'
  fill_in :password, with: 'ilovecats'
  fill_in :password_confirmation, with: 'ilovedogs'
  click_button 'Sign up!'
end
