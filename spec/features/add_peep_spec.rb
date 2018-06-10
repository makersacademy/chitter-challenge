feature 'Adding Peep' do
    scenario 'user can create a peep' do
        visit('/')
        fill_in('content', with: 'My first peep!')
        click_button('submit')
        expect(page).to have_content("My first peep!")
    end
end