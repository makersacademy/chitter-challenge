require './chitter'

RSpec.describe 'feature tests' do
  before(:each) do
    test_db_initialise
  end

# STRAIGHT UP
#
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#

  feature 'index' do

    scenario 'user sees the homepage' do
      visit('/')
      expect(page).to have_content "Chitter: look at these peeps"
    end

    scenario 'peeps are seen on the homepage' do
      visit('/')
      expect(page).to have_content "The first peep in the test database"
      expect(page).to have_content "The sixth peep in the test database"
    end

  end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#

feature 'multiple peeps in reverse chronological order' do


  RSpec::Matchers.define :appear_before do |later_content|
   match do |earlier_content|
     page.body.index(earlier_content) < page.body.index(later_content)
   end
 end
  scenario 'user sees peeps in reverse chronological order' do
    visit('/')
    expect("first peep").to appear_before("second peep")
  end

end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
#
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
#
# HARDER
#
# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter
#
# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
#
# ADVANCED
#
# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep

end
