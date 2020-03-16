feature 'viewing a list of peeps' do
  scenario 'user can see a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # add the test data
    Peep.create(message:'peep test 1')
    Peep.create(message:'peep test 2')
    Peep.create(message:'peep test 3')

    visit('/')

    expect(page).to have_content('peep test 1')
    expect(page).to have_content('peep test 2')
    expect(page).to have_content('peep test 3')
  end
end
