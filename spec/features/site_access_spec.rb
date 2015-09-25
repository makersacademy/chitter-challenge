feature 'As a member' do 

      let(:user) do 
        User.new(name: 'Janet', 
                 user_name: 'Jane', 
                 email: 'janet@example.com') 
      end
      
      before do
        sign_up_a user, '12345'
        click_button 'Sign out'  
      end
      
    scenario 'I can log out, after logging in' do   
      expect(page).to have_content "Goodbye"  
    end
    
    scenario 'I can sign in with a valid password' do
      sign_in_a user, '12345'
      expect(page).to have_content "#{user.user_name} is logged in."
    end
    
    scenario 'I cannot sign in with an invalid password' do 
      sign_in_a user, 'wrong'
      expect(page).to have_content "Wrong Password"
    end 

end