def sign_up(full_name: 'Samuel Russell Hampden Joseph',
            user_name: 'tansaku',
            email: 'sam@makersacademy.com',
            password: 's3cr3t',
            password_confirmation: 's3cr3t')
  visit '/'
  fill_in :full_name, with: full_name
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up for Chitter'
end
