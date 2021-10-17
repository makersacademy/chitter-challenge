require 'pg'

# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Viewing peeps' do
  scenario 'see all peeps in Chitter' do
    Peeps.create(name: 'Developer Joe',peep: 'I am a Pull Stack Developer.',tags: '#programming')
    Peeps.create(name: 'Developer Angela', peep: 'Debugging is like an onion.',tags: '#programming')
    visit ('/chitter')
    expect(page).to have_content('I am a Pull Stack Developer.')
    expect(page).to have_content('#programming')
  end
end


