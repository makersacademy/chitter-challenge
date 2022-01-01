require 'pg'
require 'time'

feature 'Visits the homepage' do
  scenario 'Visiting the index page' do
    visit('/')
    expect(page).to have_content 'Hello and Welcome to Chitter!'
  end
end

feature 'Viewing peeps' do 
  scenario 'A user can see peeps' do
    Peep.create(text: 'Hello I am a peep!')
    Peep.create(text: 'I too am a peep!')
    
    visit('/peeps')
    
    expect(page).to have_content('Hello I am a peep!')
    expect(page).to have_content('I too am a peep!')
  end

  scenario 'A user can see time of peep' do
    allow(Time).to receive(:now).and_return(Time.parse("2022-01-01 20:00:00 +0100"))
    Peep.create(text: 'Chrono Peep!')
    visit '/peeps'
    expect(page).to have_content('Chrono Peep! 20:00, 14 November')
  end
  
end
