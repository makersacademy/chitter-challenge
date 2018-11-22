feature "Chitter home page" do
  scenario "it shows the default peeps" do
    visit '/'
    expect(page).to have_content "The first peep on Chitter!"
    expect(page).to have_content "Coming up with fun examples is HARD..."
  end
end
