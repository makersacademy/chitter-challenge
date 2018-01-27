# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made


feature 'View peep' do
    scenario 'User can view a peep on chitter' do
      Peep.create(body: 'My first peep')
      visit '/'
      expect(page).to have_content("My first peep")
    end
  end