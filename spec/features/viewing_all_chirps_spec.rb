feature 'Viewing chirps' do
    scenario 'A user can see chirps' do
        connection = PG.connect(dbname: 'chitter_test')

        Chirps.create(chirp: 'This is one chirp', title: '1 Chirp')
        Chirps.create(chirp: 'This is another chirp', title: '2 Chirp')
        Chirps.create(chirp: 'This is a totally different chirp', title: '3 Chirp')

        visit('/chirps')
    
        expect(page).to have_content "This is one chirp"
        expect(page).to have_content "This is another chirp"
        expect(page).to have_content "This is a totally different chirp"
        expect(page).to have_content "1 Chirp"
        expect(page).to have_content "2 Chirp"
        expect(page).to have_content "3 Chirp"
    end
end