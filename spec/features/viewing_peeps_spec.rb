feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Peeps"
  end

  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "Peep peep!"
    expect(page).to have_content "peeping away 🐥"
  end
end
