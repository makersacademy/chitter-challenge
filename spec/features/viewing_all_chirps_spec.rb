feature 'Viewing chirps' do
    scenario 'A user can see chirps' do
        connection = PG.connect(dbname: 'chitter_test')

        Chirps.create(chirp: 'This is one chirp')
        Chirps.create(chirp: 'This is another chirp')
        Chirps.create(chirp: 'This is a totally different chirp')

        visit('/chirps')
    
        expect(page).to have_content "This is one chirp"
        expect(page).to have_content "This is another chirp"
        expect(page).to have_content "This is a totally different chirp"
    end
end