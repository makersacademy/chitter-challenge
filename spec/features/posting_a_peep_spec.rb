require 'launchy'

feature "peep page" do

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

  scenario "User posts a peep" do
    visit "/sessions/new"
    sign_in(email: user.email, password: 'secret1234')
    click_button "Go to peeps page"
    click_button("Add peep")
    fill_in :message, with: "Hey everyone"
    click_button "Submit"
    expect(page).to have_content("Hey everyone")
  end

  scenario "User adds 3 peeps and sees them in reverse chronological order" do
    t = Time.new.strftime("%H:%M")
    visit "/sessions/new"
    sign_in(email: user.email, password: 'secret1234')
    click_button "Go to peeps page"
    click_button("Add peep")
    fill_in :message, with: "First"
    click_button "Submit"
    click_button("Add peep")
    fill_in :message, with: "Second"
    click_button "Submit"
    click_button("Add peep")
    fill_in :message, with: "Third"
    click_button "Submit"
    # save_and_open_page
    expect(page).to have_content("Third #{t}\n(posted by #{user.username})\nSecond #{t}\n(posted by #{user.username})\nFirst #{t}\n(posted by #{user.username})")
  end

  scenario "User posts a peep and sees their username and the time it was posted" do
    t = Time.new.strftime("%H:%M")
    visit "/sessions/new"
    sign_in(email: user.email, password: 'secret1234')
    click_button "Go to peeps page"
    click_button("Add peep")
    fill_in :message, with: "Testing peep"
    click_button "Submit"
    expect(page).to have_content("Testing peep #{t}\n(posted by #{user.username})")
  end
end
