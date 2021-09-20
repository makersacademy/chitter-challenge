feature 'maker can post a peep message' do
    scenario 'whilst signed in' do
        valid_create_account
        expect(page).to have_content "Create a peep message"
        fill_in :message, with: "This is my peep message!"
        click_button 'Peep'
        expect(page).to have_content "This is my peep message!"
    end
end