require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see their peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/peeps/add')
    fill_in('peep', with: 'My first Peep!')
    click_button('Submit')
    expect(page).to have_content "My first Peep!"
  end
end
