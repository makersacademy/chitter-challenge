
feature 'View peeps' do
  scenario 'Visit homepage to view peeps' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/peeps')
    expect(page).to have_content("My first peep!")
  end
end
