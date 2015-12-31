# As a user
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Viewing Peeps' do
  xscenario 'homepage displays all peeps in reverse chronological order' do
    Peep.create(user: 'joe')
  end
end
