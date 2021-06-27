#I want to post a message (peep) to chitter

feature 'posting a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'Hello again!')
    click_button('Submit')

    expect(page).to have_content('Hello again!')
  end
end