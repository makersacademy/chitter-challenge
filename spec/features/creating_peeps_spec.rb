feature 'Create a new peep' do
  scenario 'User writes a peep' do
    visit '/peeps/new'
    fill_in 'contents', with: "New peep"
    click_button "Post"

    expect(page.current_path).to eq '/peeps'
    expect(page).to have_content "New peep"
  end
end
