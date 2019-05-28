feature 'New Peep and View Peeps' do
    scenario 'can make a new Peep' do
        visit('/peeps')
        fill_in 'peep', with: "I love weekend challenges!"
        click_button 'Post'
        expect(page).to have_content "I love weekend challenges!"
        expect(current_path).to eq '/peeps'
    end
end