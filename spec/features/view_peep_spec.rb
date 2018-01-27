# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'view peeps' do
  scenario 'user can view a peep on chitter' do
    p 'hello'
    Peep.create(peep: 'My first peep')
    p 'peep created'
    visit '/'
    p 'cant visit this'
    # fill_in :peep, with: "My first peep"
    expect(page).to have_content("My first peep")
  end
end
