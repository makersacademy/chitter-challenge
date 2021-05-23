feature 'Updating a chirp' do
    scenario 'A user can update a chirp' do
        chirp = Chirps.create(chirp: 'Editing this chirp', title: 'Editing chirp')
        visit('/chirps')
        expect(page).to have_content('Editing chirp')
        expect(page).to have_content('Editing this chirp')
        
        first('.chirp').click_button 'Edit'
        expect(current_path).to eq "/chirps/#{chirp.id}/edit"
    
        fill_in('title', with: "Edited Chirp")
        fill_in('chirp', with: "Edited this chirp")
        click_button('Submit')
    
        expect(current_path).to eq '/chirps'
        expect(page).not_to have_content('Editing Chirp')
        expect(page).to have_content('Edited this chirp')
    end
  end