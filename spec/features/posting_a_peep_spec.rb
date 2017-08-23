feature "peep page" do

  before do
    # Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end
  scenario "User posts a peep" do
    visit "/peeps"
    click_button("Add peep")
    fill_in :message, with: "Hey everyone"
    click_button "Submit"
    expect(page).to have_content("Hey everyone")
  end
end
