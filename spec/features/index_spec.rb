
feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/')

    expect(page).to have_content "My 0th test peep"
    expect(page).to have_content "Another test peep"
    expect(page).to have_content "The last test peep"
  end
end

feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/')
    fill_in('message', with: 'I am adding a new peep')
    click_button('Submit')

    expect(page).to have_content 'I am adding a new peep'
  end
end
