feature 'homepage' do
  scenario 'hompage has link to peeps and create new peep' do
    visit('/')

    expect(page).to have_link('Peeps', href: '/peeps')
    expect(page).to have_link('Create new peep', href: '/peeps/new')
  end
end
