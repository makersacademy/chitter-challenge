# User story 2
# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Display peeps' do
  scenario 'User sees the posted peeps reverse chronological order' do
    Peep.create(peep: "My first peep")
    Peep.create(peep: "My second peep")
    Peep.create(peep: "My third peep")
    visit ('/')
    expect("My third peep").to appear_before("My second peep")
    expect("My second peep").to appear_before("My first peep")
  end
end