

feature 'display peeps' do
  scenario 'peeps appear in reverse date order' do
    Peep.create(peep_text: 'Hello')
    Peep.create(peep_text: 'CatFace')
    Peep.create(peep_text: 'Bazaar')
    expect('Bazaar').to appear_before('Hello')
  end
end
