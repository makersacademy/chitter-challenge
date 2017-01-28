feature "User can sign in and out" do 
    
    let!(:user) do
        User.create(email: 'michael@jackson.com',
                    name: 'Michael Jackson',
                    user_name: 'mj',
                    password: 'password',
                    password_confirmation: 'password')
    end
    
    scenario 'sign in with correct details' do
        sign_in(email: user.email, password: user.password)
        expect(page).to have_content "Hey there, #{user.user_name}"
    end
    
    # scenario 'can sign out' do
    #     sign_in(email: user.email, password: user.password)
    #     click_button 'Sign out'
    #     expect(page).to have_content('Farewell!')
    #     expect(page).not_to have_content('Welcome, michael@jackson.com')
    # end
end
