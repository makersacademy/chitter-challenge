
# User Story 1.
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'To post a peep' do
  scenario 'I want to be able to submit a new peep' do
    Peep.create(wording: "Hello peeps")
    visit ('/peeps')
    expect(page).to have_content 'Hello peeps'
  end
end
