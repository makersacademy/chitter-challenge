feature 'Posting a peep' do
    
    let!(:user) do
        User.create(email: 'michael@jackson.com',
                    name: 'Michael Jackson',
                    user_name: 'mj',
                    password: 'password',
                    password_confirmation: 'password')
    end
    
    scenario 'I can post a peep' do
        sign_in(email: user.email, password: user.password)
        fill_in 'peep', with: "This is a peep"
        click_button 'Post my peep'
        expect(current_path).to eq '/peeps'
        within 'dl#peeps' do
            expect(page).to have_content("This is a peep")
        end
    end
end