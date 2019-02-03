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
    expect(page).to have_content("MEOW!")
    expect(page.body.index('MEOW') < page.body.index('Hello'))
  end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
  scenario 'A user visiting the homepage can see the timestamp of peeps' do
    visit('/')
    expect(page).to have_content("Posted at:")
    expect(page).to have_content(Time.now.hour)
  end
end
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Registration' do
  scenario 'A user can sign up for Chitter' do
    visit('/register')
    fill_in :name, with: "Chitter User"
    fill_in :username, with: "ChitterUser"
    fill_in :email, with: "chitteruser@chitter.com"
    fill_in :password, with: "Password123"
    click_button "Register"
    expect(page).to have_content("Welcome to Chitter, Chitter User!")
  end
  scenario 'Users have their usernames shown next to peeps' do
    visit('/')
    expect(page).to have_content("Larry")
  end
end
