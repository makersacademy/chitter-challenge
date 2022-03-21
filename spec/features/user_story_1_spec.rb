# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Posting a peep' do
  scenario 'User can add peep to chitter' do
    add_peep('This is a test peep.')
    expect(page).to have_text('This is a test peep.')
  end
end
