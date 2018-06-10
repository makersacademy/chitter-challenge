feature 'create peeps' do
    scenario 'user can add a peep and post it' do

        visit '/'
        fill_in('peep', with: 'peep test')
        click_button('peep')
        expect(page).to have_content 'peep test'

    end

    scenario 'show error if peep > 140 characters' do
        long_peep = 'a'*141

        visit '/'
        fill_in('peep', with: long_peep)
        click_button('peep')
        expect(page).to have_content('you peeped too long!')

    end

end