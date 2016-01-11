feature 'View Peeps' do

    scenario 'I can see existing peeps on the peeps page' do
        Peep.create(user: 'TaraRumba', message: 'watching telly all night')
        visit '/peeps'
            expect(page.status_code).to eq 200

        within 'ul#peeps' do
            expect(page).to have_content('watching telly all night')
        end
    end

end
