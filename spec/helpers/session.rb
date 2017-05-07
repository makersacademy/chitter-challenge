module SessionHelpers

 def sign_in(email:, password:)
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end

 def sign_up(email: 'alice@example.com',
             password: '12345678',
             password_confirmation: '12345678')
    visit '/users/new'
    fill_in :name, with: 'example'
    fill_in :username, with: 'example123'
    fill_in :email, with: 'example@email.com'
    fill_in :password, with: 'example'
    fill_in :password_confirmation, with: 'example'
    click_button 'Sign up'
 end

end
