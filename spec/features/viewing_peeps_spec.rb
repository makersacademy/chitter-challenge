require 'pg'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'A user can see all peeps' do
    
    Peep.create(peep:'Congratulations to the Astronauts that left Earth today. Good choice')
    Peep.create(peep: 'Me, in hell: I was told there would be a “special” place for me?')
    
    visit('/peeps')

    expect(page).to have_content("Congratulations to the Astronauts that left Earth today. Good choice")
    expect(page).to have_content("Me, in hell: I was told there would be a “special” place for me?")
  end

  scenario 'A user can see peeps in reverse cronological order' do
    Peep.create(peep:'Congratulations to the Astronauts that left Earth today. Good choice')
    Peep.create(peep: 'Me, in hell: I was told there would be a “special” place for me?')
    
    visit('/peeps')

    first_peep = 'Congratulations to the Astronauts that left Earth today. Good choice'
    second_peep = 'Me, in hell: I was told there would be a “special” place for me?'

    expect(second_peep).to appear_before(first_peep, only_text: true)
  end
end
