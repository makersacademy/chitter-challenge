feature "Check if test envoirment work" do
  scenario "Load the homepage" do 
    visit("/")
    expect(page).to have_content "Home"
  end
end