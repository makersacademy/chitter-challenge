feature '#add' do
    scenario 'Add peeps from the peeps page' do
        visit('/peeps')
        click_button('Add Peep')
        fill_in('Type your peep', with: 'This is a test peep')
        click_button('Send Peep')
        expect(page).to have_content('This is a test peep')
    end
end