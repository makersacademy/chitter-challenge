feature 'Viewing peeps' do
    scenario 'A Maker can view peeps' do
        visit('/peeps')

        expect(page).to have_content('First database table peep!')
        expect(page).to have_content('Peep peep')
        expect(page).to have_content('Chitter chatter')
    end
end