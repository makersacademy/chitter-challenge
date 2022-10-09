require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app.rb'
require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/spec/spec_helper.rb'
require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/Models/peep.rb'
#No RSpec.describe needed for feature tests

feature 'Viewing peeps' do
  before { Peep.create(message:'The message', username: 'newusername', fullname: 'TestFull Name', timestamp: '2000-10-10 00:00:00')}
  feature 'Visiting homepage' do
    xscenario 'View the set parameters' do
    visit '/peeps'
    expect(page).to have_content('The message')
    expect(peep).to have_content('newusername')
    expect(peep).to have_content('TestFull Name')
    expect(peep).to have_content('2000-10-10 00:00:00')
    end
  end
end

# let! (:peep) {Peep.create(message:'The message', username: 'newusername', fullname: 'TestFull Name', timestamp: '2000-10-10 00:00:00')}


