feature 'So that I can better appreciate the context of a peep' do
  scenario 'I want to see the time at which it was made' do
    peep_1 = Peep.create(message: 'Peep 1')
    peep_2 = Peep.create(message: 'Peep 2')
    peep_3 = Peep.create(message: 'Peep 3')

    visit('/peeps')

    expect(page).to_not have_content 'Sinatra'
    expect(page).to have_content 'Peep 1'
    expect(page).to have_content 'Peep 2'
    expect(first('.peep')).to have_content 'Peep 3'
    expect(first('.peep')).to have_content peep_3.time.strftime("%A at %H:%M")

  end
end
