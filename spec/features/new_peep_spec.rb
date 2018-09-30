
feature "new peep" do
    scenario "allows user to add a peep" do
        visit '/chitter/peep'
        fill_in 'peep', with: "Test peep"
        click_button 'Post'
        expect(current_path).to eq '/chitter'
        expect(page).to have_content 'Test peep'
    end
end
