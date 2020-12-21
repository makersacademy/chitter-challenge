require 'pg'

feature 'testing homepage functionality' do
  scenario 'ensuring the homepage has content' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end

feature 'testing form functionality' do
  scenario 'ensuring that the form submits the name that is entered into it' do
    visit('/')
    fill_in(:Username, with: 'Oli Le Maire')
    click_button('Submit')
    expect(page).to have_content('Oli Le Maire')
  end
end

feature 'viewing usernames' do
  scenario 'a new user can see his new username' do
    connection = PG.connect(dbname: 'chitter_members_test')

    connection.exec("INSERT INTO chitter_members_data VALUES (1, 'Oli Le Maire');")

    visit('/welcome_to_chitter')

    expect(page).to have_content("Oli Le Maire")
  end
end
