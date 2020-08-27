feature 'all peeps'  do
  scenario 'shows all of the users peeps' do
    visit '/peeps'
    expect(page).to have_content('Peeps:')
  end
end
