feature 'viewing peeps' do
  scenario 'allows user to see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(text: 'First tester')
    Peep.create(text: 'Second tester')
    Peep.create(text: 'Third tester')

    visit '/chitter'

    expect(page).to have_content 'First tester'
    expect(page).to have_content 'Second tester'
    expect(page).to have_content 'Third tester'
  end

  scenario 'shows peeps in reverse chronological order' do
    Peep.create(text: 'First tester')
    Peep.create(text: 'Second tester')
    Peep.create(text: 'Third tester')

    visit '/chitter'

    # first_section = find_by_id('hello')
    expect(page).to have_selector(id: '1', text: 'Third tester')
  end

  scenario 'shows timestamp of peep' do
    peep = Peep.create(text: 'Timestamp tester')

    visit '/chitter'

    expect(page).to have_content '2020-12-22'
  end
end
