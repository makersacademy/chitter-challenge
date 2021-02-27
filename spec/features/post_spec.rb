feature 'chitter post' do
    scenario 'i can fill out a box and it posts it to the chitter feed' do
        visit('/home')
        fill_in :post, with: 'Howdy'
        expect(page).to have_content 'Howdy'
    end
end