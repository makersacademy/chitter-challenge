feature 'Posting' do
  scenario "A user can post a peep" do
    sign_up
    sign_in
    visit '/peeps/new'
    fill_in :peep, with: "This is a peep"
    click_button "Peep!"
    expect(page).to have_content("This is a peep")
  end
end
