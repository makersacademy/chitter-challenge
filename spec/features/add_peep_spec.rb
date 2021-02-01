require './spec/test_helpers'

feature 'add peep' do 
    scenario 'you should be able to post a peep' do 
        sign_up_and_continue
        click_link "Add Peep"
        fill_in("peep", with: "This is my first peep")
        click_button 'Post Peep'
        expect(page).to have_content "This is my first peep"
    end
end
