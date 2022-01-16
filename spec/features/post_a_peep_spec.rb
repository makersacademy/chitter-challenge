feature 'Adding a post (peep)' do
    scenario 'Write a peep and post it' do
        visit('/peeps/new')
        fill_in('peep', with: 'Test peep')
        click_button('Post')

        expect(page).to have_content 'Test peep'
    end
end
