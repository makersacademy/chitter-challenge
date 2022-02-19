
feature 'Can post a peep' do
    scenario 'A user can write and post a peep' do
        visit('/addpeep')
        fill_in('peep', with: 'test peep')
        click_button('Submit')
        expect(page).to have_content 'test peep'
    end
end
