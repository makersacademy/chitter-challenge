feature 'create peeps' do
    scenario 'user can add a peep and post it' do

        visit '/'
        fill_in('peep', with: 'peep test')
        click_button('peep')
        expect(page).to have_content 'peep test'

    end
end