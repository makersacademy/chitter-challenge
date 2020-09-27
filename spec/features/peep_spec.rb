feature 'Add peep to peep list' do
    scenario 'Add peeps from the peeps page' do
        visit('/peeps')
        click_link('Add Peep')
        fill_in('peep_content', with: 'This is a test peep')
        click_button('Send Peep')
        expect(page).to have_content('This is a test peep')
    end
end