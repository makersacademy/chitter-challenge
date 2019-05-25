# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a maker
# So that I can see what others are saying
# I want to see all peeps

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('hello');")
    connection.exec("INSERT INTO peeps (message) VALUES('world');")

    visit('/chitter')
    click_button('submit')

    expect(page).to have_content 'hello'
  end
end
