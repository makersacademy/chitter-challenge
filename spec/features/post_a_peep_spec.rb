feature 'Post peeps' do
  scenario 'A user can post a peep' do
    visit('/peeps/new')
    fill_in("peep text", with: "This is my peep")
    click_button("Submit")

    expect(current_path).to eq("/peeps")
    expect(page).to have_content("This is my peep")
  end
end
