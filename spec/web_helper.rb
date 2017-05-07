def sign_up
  visit '/new_user'
  fill_in :email, with: 'eren@makersacademy.com'
  fill_in :password, with: 'password'
  fill_in :name, with: 'Eren Jaeger'
  fill_in :user_name, with: 'kyojin'
  click_button 'Register'
end
