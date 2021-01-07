feature 'logging in and out' do

    before do
        sign_up(name:'Yasmin',handle:'@yaz',email:'yaz@example.com',password:'password123')
    end
    
    scenario 'a user can log out' do 
        expect(page).to have_content "Welcome Yasmin - @yaz"
        click_button 'Log Out'
        expect(page).to_not have_content "Welcome Yasmin - @yaz"
    end

    scenario 'a user can log in' do
        click_button 'Log Out'
        expect(page).to_not have_content "Welcome Yasmin - @yaz"
        click_button 'Login'
        fill_in 'email', with: 'yaz@example.com'
        fill_in 'password', with: 'password123'
        click_button 'Login'
        expect(page).to have_content "Welcome Yasmin - @yaz"
    end

end