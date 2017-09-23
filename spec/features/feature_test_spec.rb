# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Can post a message (peep) to Chitter' do
  scenario 'a user wants to post a message' do
    Peep.create(message: 'Hello world!')
    visit '/peeps'
    expect(page).to have_content 'Hello world!'
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Can view all peeps in reverse chronological order' do
  scenario 'User adds 2 peeps then wants to view them' do
      Peep.create(message: 'Hello world!')
      Peep.create(message: 'Just chillin with the bae')
      visit '/peeps'
      expect(page).to have_content 'Just chillin with the bae Hello World'
    end
  end
