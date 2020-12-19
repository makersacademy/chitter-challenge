feature 'So that I can see what others are saying,' do
  scenario 'I want to see all peeps in reverse chronological order' do
    Peep.create(message: 'Peep 1')
    Peep.create(message: 'Peep 2')
    Peep.create(message: 'Peep 3')

    visit('/peeps')

    expect(page).to_not have_content 'Sinatra'
    expect(first('.peep')).to have_content 'Peep 3'
  end
end
