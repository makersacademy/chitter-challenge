require_relative "../web_helpers"

feature "new peep" do
  scenario "allows user to add a peep" do
    logged_on
    visit '/peeps/new'
    fill_in 'peep', with: "Test peep"
    click_button 'Post'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Test peep'
  end
end
