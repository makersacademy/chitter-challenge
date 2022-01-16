def sign_up_helper
  visit('/registrations/sign-up')
  fill_in('name', with: 'Mr. Test')
  fill_in('username', with: 'mr_test')
  fill_in('password', with: 'password')
  fill_in('email', with: 'test@test-mail.com')
  click_button('Sign Up')
end 

def user_sign_up_and_Peep_create_peep(message)
  user = User.sign_up(name: "Mr Test", username: "test_123", 
    password: "test@gmail.com", email: "password")
    
  peep = Peep.create_peep(message: "#{message}", user_id: 1)
end