require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    user = User.create(username: 'testusername123', email: 'test@example.com', password: 'password123')
    user
    visit 'sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    Peep.create(text: "This is the first test peep", user_id: user.id)
    Peep.create(text: "This is the second test peep", user_id: user.id)
    Peep.create(text: "This is the third test peep", user_id: user.id)

    visit '/peeps/index'

    expect(page).to have_content "This is the first test peep"
    expect(page).to have_content "This is the second test peep"
    expect(page).to have_content "This is the third test peep"
  end
end