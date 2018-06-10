feature 'read peeps' do
    scenario 'peeps are displayed in reverse chronological order' do

        visit '/'
        fill_in('peep', with: 'first_peep_test')
        click_button('peep')
        fill_in('peep', with: 'second_peep_test')
        click_button('peep')

        expect('first_peep_test').to_not appear_before('second_peep_test')

    end
end