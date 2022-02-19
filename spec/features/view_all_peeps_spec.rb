feature 'To view all peeps' do
    scenario 'We can view peeps' do
        visit('/peeps')
        expect(page).to have_content('test peep')
    end
end