feature 'Home page message' do
  scenario "Has the app title on the homepage" do
    visit '/peeps'
    expect(page). to have_content("CHITTER")
  end
end

# feature 'Name shown on page' do
#   scenario 'submitting names' do
#     sign_in_and_play
  # click_button 'ROCK'
#     expect(page).to have_content("Shoto")
#   end
# end
