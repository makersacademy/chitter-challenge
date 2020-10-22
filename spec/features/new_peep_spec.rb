feature 'posting a peep' do
  scenario 'A user can post a peep to chitter' do
    visit '/chitter'
    expect(page).to have_content('Hey chitter!')
  end
end
