
feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/')

    expect(page).to have_content "0th"
    expect(page).to have_content "1st"
    expect(page).to have_content "2nd"
  end
end

feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/')
    fill_in('txt', with: 'Add peep')
    click_button('Submit')

    expect(page).to have_content 'Add peep'
  end
end
