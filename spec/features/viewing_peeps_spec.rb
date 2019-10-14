feature 'Viewing peeps.' do
  scenario 'A user can view peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # test data
    Peep.create(peep: "first peep", user_id: 1)
    Peep.create(peep: "second peep", user_id: 1)
    Peep.create(peep: "third peep", user_id: 1)

    visit('/peeps')

    expect(page).to have_content "first peep"
    expect(page).to have_content "second peep"
    expect(page).to have_content "third peep"
    time = Time.new
    expect(page).to have_content "#{time.min}"
  end
end
