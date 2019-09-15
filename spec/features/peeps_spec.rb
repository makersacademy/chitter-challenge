feature 'Testing peeps page' do
  scenario 'View <Hello! You are on Chitter> displayed' do
    visit('/')
    expect(page).to have_content 'Hello! You are on Chitter'
  end

  scenario 'View peeps and date' do
    peep1 = Peep.create(peep: 'I am happy')
    peep2 = Peep.create(peep: 'I am sad')
    peep3 = Peep.create(peep: 'I am hungry')
    visit('/peeps')
    expect(page).to have_content(peep1.peep)
    expect(page).to have_content(peep2.peep)
    expect(page).to have_content(peep3.peep)
  end


end
