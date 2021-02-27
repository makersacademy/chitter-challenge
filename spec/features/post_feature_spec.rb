feature 'post a peep' do
    scenario 'i can fill out a box and it posts it to the chitter feed' do
        visit('/home')
        fill_in :peep_post, with: 'Howdy'
        expect(page).to have_content 'Howdy'
    end
end