feature 'Viewing chirps' do
    scenario 'A user can see chirps' do
        visit('/chirps')
    
        expect(page).to have_content "This is one chirp"
        expect(page).to have_content "This is another chirp"
        expect(page).to have_content "This is a totally different chirp"
    end
end