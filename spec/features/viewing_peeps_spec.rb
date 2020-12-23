feature 'viewing peeps' do
  scenario 'shows peeps in reverse chronological order' do
    Peep.create(text: 'First tester')
    Peep.create(text: 'Second tester')
    Peep.create(text: 'Third tester')

    visit '/chitter'

    expect(page).to have_selector(id: '1', text: 'Third tester')
    expect(page).to have_selector(id: '2', text: 'Second tester')
    expect(page).to have_selector(id: '3', text: 'First tester')
  end

  scenario 'shows timestamp of peep' do
    Peep.create(text: 'Timestamp tester')

    visit '/chitter'

    expect(page).to have_content Time.now
  end
end
