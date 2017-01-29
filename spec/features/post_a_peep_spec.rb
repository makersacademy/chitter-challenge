feature 'Posting a peep' do
    
    let!(:user) do
        User.create(email: 'michael@jackson.com',
                    name: 'Michael Jackson',
                    user_name: 'mj',
                    password: 'password',
                    password_confirmation: 'password')
    end
    
    before do
        sign_in(email: user.email, password: user.password)
        Timecop.freeze do
            peep
        end
    end
    
    scenario "I can't post when I'm not signed in" do
        click_button 'Sign out'
        expect(page).not_to have_css('#peep_form')
    end
    
    scenario 'I can post a peep' do
        expect(current_path).to eq '/peeps'
        within 'dl#peeps' do
            expect(page).to have_content("This is a peep")
        end
    end
    
    scenario "I can see peeps when I'm not logged in" do
        click_button 'Sign out'
        within 'dl#peeps' do
            expect(page).to have_content("This is a peep")
        end
    end
    
    scenario "I can see the time that a peep was posted" do
        time = Time.now
        within 'dl#peeps' do
            expect(page).to have_content(time.strftime("%b %e %k:%M"))
        end
    end
end
