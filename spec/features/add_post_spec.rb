feature "add a post" do
  scenario "user adds a post in cheeter" do
    visit '/add_peep'
    fill_in :peep, with:"Hey! I'm listenning to music!"
    click_button "post"
    expect(page).to have_content "Hey! I'm listenning to music!"
  end
end
