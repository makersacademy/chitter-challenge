feature 'Return list of users' do
    scenario 'Return the name of users in a view' do
        visit('/users')
        expect(page).to have_content 'Kanye'
    end
end