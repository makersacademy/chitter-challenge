feature 'has a page for viewing peeps' do
  scenario '#can view an entered peep from KNOWN user' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO users (user_name) VALUES('Testname')")
    visit('/make_a_peep')
    fill_in :peep, with: "This is my first peep"
    fill_in :user_name, with: "Testname"
    click_button('Submit')
    expect(page).to have_content("Testname")
    expect(page).to have_content("This is my first peep")
  end
  scenario '#can view an entered peep from UNKNOWN user' do
    visit('/make_a_peep')
    fill_in :peep, with: "rose rose"
    fill_in :user_name, with: "Rosemary"
    click_button('Submit')
    expect(page).to have_content("Rosemary")
    expect(page).to have_content("rose rose")
    expect(page).to have_content("")
  end
  scenario '#can use link to add a new peep' do
    visit('view_peeps')
    click_link('Make a new peep')
  end
  scenario '#can use link to log out' do
    visit('view_peeps')
    click_link('Log out')
  end
end
