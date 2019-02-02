# STRAIGHT UP
#
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#
feature "Posting a peep" do
  scenario 'Users can post a new peep' do
    visit('/post')
    fill_in :peep, with: "Test peep, 123"
    click_button "Peep!"
    expect(page).to have_content('Test peep, 123')
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#
feature "Viewing peeps" do
  scenario 'A user visiting the homepage can see the latest peeps' do
    visit('/')
    expect(page).to have_content("Chitter")
    expect(page).to have_content("Latest peeps:")
    expect(page).to have_content("Hello, Chitter!")
  end
end
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
#
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
