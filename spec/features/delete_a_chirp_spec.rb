feature 'Deleting a chirp' do
    scenario 'A user can delete a chirp' do
        Chirps.create(chirp: 'Chirp to be deleted', title: 'Deleting')
        visit('/chirps')
        expect(page).to have_content('Deleting')
        expect(page).to have_content('Chirp to be deleted')
    
        first('.chirp').click_button 'Delete'
    
        expect(current_path).to eq '/chirps'
        expect(page).not_to have_content('Deleting')
        expect(page).not_to have_content('Chirp to be deleted')
    end
end