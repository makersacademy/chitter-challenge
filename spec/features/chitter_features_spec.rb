# STRAIGHT UP
#
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#
feature "Viewing peeps" do
  scenario 'A user visiting the homepage can see the latest peeps' do
    visit('/')
    expect(page).to have_content("Chitter")
    expect(page).to have_content("Latest peeps:")
  end
end
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
#
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
