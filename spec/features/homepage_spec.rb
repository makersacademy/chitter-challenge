feature 'homepage' do 

    scenario 'it should welcome users to Chitter' do 
        visit '/home'
        expect(page).to have_content "Welcome to Chitter"
    end

    scenario 'you should be able to post a peep' do 
        visit '/home'
        fill_in("peep", with: "This is my first peep")
        click_button 'Post Peep'
        expect(page).to have_content "This is my first peep"
    end

end
