require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    User.create(username: 'testusername123', email: 'test@example.com', password: 'password123')
    visit 'sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    
    Peep.create(text: "This is the first test peep")
    Peep.create(text: "This is the second test peep")
    Peep.create(text: "This is the third test peep")

    visit '/peeps/index'

    expect(page).to have_content "This is the first test peep"
    expect(page).to have_content "This is the second test peep"
    expect(page).to have_content "This is the third test peep"
  end
end