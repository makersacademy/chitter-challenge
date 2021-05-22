feature 'Adding a new chirp' do
    scenario 'A user can add a chirp to Chitter' do
        visit('/chirps/new')
        fill_in('chirp', with: 'This is the first feature chirp')
        fill_in('title', with: 'The title')
        click_button('Submit')
    
        expect(page).to have_content('The title')
        expect(page).to have_content('This is the first feature chirp')
    end
end