require 'pg'

feature "Posting a message" do
  scenario "Visiting the index page" do
    visit('/')
    expect(page).to have_content "Chitter"
  end
  scenario "User posts a message and sees it added to the list" do

    connection = PG.connect(dbname: 'chitter_challenge_test')
    Message.create(message: 'First post', time: Time.now)
    Message.create(message: 'Second post', time: Time.now)
    Message.create(message: 'Third post', time: Time.now)

    visit('/')
    fill_in('message', with: "What shall we do today?")
    click_button('post')
    expect(page).to have_content("First post")
    expect(page).to have_content("Second post")
    expect(page).to have_content("Third post")
    expect(page).to have_content("What shall we do today?")
  end
end
