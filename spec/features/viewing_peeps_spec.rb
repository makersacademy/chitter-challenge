feature 'Viewing peeps' do
  scenario 'A user can view the peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')

    Peeps.create(newpeep: 'here is my peep!')
    Peeps.create(newpeep: 'here is my next peep!')

    visit('/')

    expect(page).to have_content('here is my peep!')
    expect(page).to have_content('here is my next peep!')

  end
end
