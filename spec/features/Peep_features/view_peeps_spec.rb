feature 'viewing a peep' do
  scenario 'a user can view a peep on chitter' do
    Peeps.add(body: 'Weekend vibes')
    Peeps.add(body: 'insert funny peep here')
    Peeps.add(body: 'Happy Friday!')
    
    visit '/chitter'

    expect(page).to have_content('Weekend vibes')
    expect(page).to have_content('insert funny peep here')
    expect(page).to have_content('Happy Friday!')
  end
end
