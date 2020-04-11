feature 'Application runs as expected' do
  scenario "index loads with welcome message" do
    visit '/'
    expect(page).to have_content "Peep Central"
  end
end