feature 'Home page' do
  scenario 'User isn\'t logged in' do
    visit '/'
    expect(page).to have_content("Hey, Guest!")
    expect(page).not_to have_content("New Peep")
  end

  scenario 'User posts new peep' do
    signup
    login
    fill_in :message, with: 'Tiramisu is delicious.'
    click_button 'Peep'
    expect(page).to have_content("Tiramisu is delicious.")
  end

  scenario 'Peeps are displayed in descending order' do
    signup
    login
    Timecop.freeze(Time.local(1990))
    peep
    Timecop.return
    peep(message: 'I totally agree.')
    visit '/'
    expect('I totally agree.').to appear_before('Tiramisu is delicious.')
  end
end
