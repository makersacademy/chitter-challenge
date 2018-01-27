# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

require 'timecop'

feature 'View peep' do
    scenario 'User can view a peep on chitter' do
      Peep.create(body: 'My first peep')
      visit '/'
      expect(page).to have_content("My first peep")
    end

  scenario "I can see the time a peep was posted" do
    Timecop.freeze do
      Peep.create(body: 'Frozen in time!')
      visit '/'
      expect(page).to have_content(DateTime.now.strftime("%H:%M on %d %b %Y"))
    end
  end
end
