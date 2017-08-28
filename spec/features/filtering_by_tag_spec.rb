feature "filtering by tag" do

  before do
    # Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end

  let!(:user) do
    User.create(name: 'Jennifer Bacon',
                username: 'jennyb',
                email: 'user@example.com',
                password: 'secret1234')
  end

  scenario "User filters by tag" do
    visit "/sessions/new"
    sign_in(email: user.email, password: 'secret1234')
    click_button "Go to peeps page"
    click_button("Add peep")
    fill_in :message, with: "I am in France"
    fill_in :tags, with: "holidays"
    click_button "Submit"
    click_button("Add peep")
    fill_in :message, with: "I am in Germany"
    fill_in :tags, with: "holidays"
    click_button "Submit"
    click_button "Filter by tag"
    fill_in :searchtag, with: "holidays"
    click_button "Submit"
    save_and_open_page
    expect(page).to have_content("I am in France")
    expect(page).to have_content("I am in Germany")
  end

end
