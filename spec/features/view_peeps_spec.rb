
feature 'see all peeps' do
  scenario 'allows user to view all peeps' do
    Peep.create(peeps: 'This is my peep' )
    Peep.create(peeps: 'This is my second peep' )
    Peep.create(peeps: 'This is my third peep' )
    visit '/'

    expect(page).to have_content('This is my peep')
    expect(page).to have_content('This is my second peep')
    expect(page).to have_content('This is my third peep')
  end
end
