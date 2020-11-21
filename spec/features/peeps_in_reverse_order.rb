feature 'viewing peeps in reverse chronological order' do

  scenario 'visiting the peeps page' do
    User.create(peep: 'Hello World!')
    User.create(peep: 'Its a me, Mario!')
    visit('/peeps')
    # expect(page).to have_content('Hello World!')
    # expect(page).to have_content('Its a me, Mario!')
    expect(first(.peep)).to have_content('Its a me, Mario!')
  end
end
