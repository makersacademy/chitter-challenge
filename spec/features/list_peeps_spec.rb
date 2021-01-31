feature 'Show a list of peeps' do
    scenario 'display a list of peeps, newest first' do
        Peep.post(message: 'Feature test peep')
        visit '/peeps'
        expect(page).to have_content 'Feature test peep'
    end
end