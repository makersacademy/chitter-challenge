feature 'post a peep' do
    scenario 'i can fill out a box and it posts it to the chitter feed' do
        sign_up_and_login
        fill_in :peep_post, with: 'Howdy'
        click_button "Post Peep"
        expect(page).to have_content 'Howdy'
    end
end