feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Peeps"
  end

  scenario 'A user can see peeps' do
    # Add the test data
    Peep.create(peep_text: 'This is a peep')
    Peep.create(peep_text: 'Peep peep!')
    Peep.create(peep_text: 'peeping away 🐥')

    visit('/peeps')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "Peep peep!"
    expect(page).to have_content "peeping away 🐥"
  end
end
