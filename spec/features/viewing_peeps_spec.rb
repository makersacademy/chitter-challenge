require 'pg'
require 'time'
require 'timecop'
require 'register_helpers'

feature 'Visits the homepage' do
  scenario 'Visiting the index page' do
    visit('/')
    expect(page).to have_content 'Hello and Welcome to Chitter!'
  end
end

feature 'Viewing peeps' do 
  before do
    Timecop.freeze
    @time = Time.now.strftime("%H:%M, %d %B")
  end

  scenario 'A user can see peeps with username and time' do
    signup
    login
    visit('/peeps')
    click_button 'New Peep!'
    visit('/peeps/new')
    fill_in 'text', with: 'Hello I am a peep!'
    click_button 'Submit'

    expect(page).to have_content('Hello I am a peep!')
    expect(page).to have_content('Hagrid')
    expect(page).to have_content(@time)

    
  end

  # scenario 'A user can see time of peep' do
  #   signup
  #   login
  #   visit('/peeps')
  #   click_button 'New Peep!'
  #   visit('/peeps/new')
  #   fill_in 'text', with: 'Hello I am a peep!'
  #   click_on "Submit"
  #   allow(Time).to receive(:now).and_return(Time.parse("2022-01-25 20:00:00 +0100"))
    
  #   expect(page).to have_content('Hello I am a peep! - 20:00, 25 January')
  # end

  # scenario 'a username shows next to its peep' do
  #   signup
  #   login
  #   visit('/peeps')
  #   click_button 'New Peep!'
  #   visit('/peeps/new')
  #   fill_in 'text', with: 'Hello I am a peep!'
  #   click_on "Submit"
  #   allow(Time).to receive(:now).and_return(Time.parse("2022-01-25 20:00:00 +0100"))
  
  #   expect(page).to have_content('User Peep - Hagrid - 20:00, 25 January')
  # end
  
end
