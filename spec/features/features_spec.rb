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

feature "Register account" do
  scenario "A user can register with an email address and details" do
    visit('/')
    click_button('register')
    fill_in('first_name', with: "Lucas")
    fill_in('last_name', with: "Razzell")
    fill_in('user_name', with: "Sacul")
    fill_in('password', with: "Banana")
    fill_in('email', with: "lucas.razzell@gmail.com")
    click_button('proceed')
    expect(page).to have_content("Chitter")
  end
end
