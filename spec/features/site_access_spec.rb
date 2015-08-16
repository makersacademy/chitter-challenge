feature 'As a member' do 

      user = User.new(name: 'Janet', 
               user_name: 'Jane', 
               email: 'janet@example.com',
               password: '12345')
      
    scenario 'I can sign in with a valid password' do
      sign_up_a user
      sign_in_a user
      expect(page).to have_content "#{user.user_name} is logged in."
    end

    scenario 'I cannot sign in with an invalid password'
    scenario 'i can log out, after logging in'

end