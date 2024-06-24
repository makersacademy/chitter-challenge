feature 'creating a new peep' do 
    scenario 'a user can post a new peep' do
        visit ('/chitter/new')
        fill_in('message', with: 'Test New Peep')
        click_button('Post Peep')

        expect(page).to have_content 'Test New Peep'
    end 
end