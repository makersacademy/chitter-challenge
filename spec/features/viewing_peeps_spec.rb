require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see their peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/peeps/add')
    fill_in('peep', with: 'My first Peep!')
    click_button('Submit')
    expect(page).to have_content "My first Peep!"
  end

  scenario 'A user can see their peeps in reverse chronological order' do
    visit('/peeps/add')
    fill_in('peep', with: 'My first Peep!')
    click_button('Submit')
    click_button('Add a Peep')
    fill_in('peep', with: 'Look at all my Peeps')
    click_button('Submit')
    expect(page).to have_content("Look at all my Peeps", "My first Peep!")
  end
end
