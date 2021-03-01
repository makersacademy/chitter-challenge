feature 'log out' do
    scenario 'users can log out of their current session' do 
        sign_up_and_login
        click_link 'Log Out'
        expect(current_path).to eq('/')
    end
end