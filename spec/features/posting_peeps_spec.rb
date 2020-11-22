feature 'Posting peeps' do
    scenario 'A Maker can post a peep' do
        visit('/peeps/new')
        fill_in('content', with: 'Lavender or grapefruit washing up liquid?')
        click_button('Post')

        expect(page).to have_content('Lavender or grapefruit washing up liquid?')
    end
end
