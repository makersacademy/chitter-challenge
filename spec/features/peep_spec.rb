feature 'peeps' do
  scenario 'homepage shows all peeps' do
    Peep.create(body: 'This is my first peep!')
    Peep.create(body: 'This is my second peep!')
    visit '/'
    expect(page).to have_content 'This is my first peep!'
    expect(page).to have_content 'This is my second peep!'
  end

  scenario 'I want to create a new peep' do
    visit '/peep/new'
    fill_in :body, with: 'This is a peep'
    click_button 'Peep!'
    expect(page).to have_content 'This is a peep'
  end

  xscenario 'displays a time stamp on peep' do

  end

  xscenario 'displays peeps in reverse cronological order' do

  end
end
