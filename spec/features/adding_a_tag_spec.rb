feature "tags on peep page" do

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

  scenario "User posts a peep with a tag" do
    visit "/sessions/new"
    sign_in(email: user.email, password: 'secret1234')
    click_button "Go to peeps page"
    click_button("Add peep")
    fill_in :message, with: "I am in France"
    fill_in :tags, with: "holidays"
    click_button "Submit"
    expect(page).to have_content("#holidays")
  end

  scenario "User posts a peep with multiple tags" do
    visit "/sessions/new"
    sign_in(email: user.email, password: 'secret1234')
    click_button "Go to peeps page"
    click_button("Add peep")
    fill_in :message, with: "I am in France"
    fill_in :tags, with: "holidays, oohlala"
    click_button "Submit"
    expect(page).to have_content("#holidays #oohlala")
  end
end
