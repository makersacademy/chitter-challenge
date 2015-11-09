# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#
# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
#

feature "So that I can let people know what I am doing" do
  scenario "I want to post a peep" do
    visit '/'
    click_link('signin')
    fill_in :email,       with: "user@email.com"
    fill_in :password,    with: "12345678"
    click_button('Sign In')
    click_link('postp')
    expect(page.status_code).to eq 200
  end

  scenario "I want to see date/time on the peeps that are posted" do
    visit '/'
    click_link('signin')
    fill_in :email,       with: "user@email.com"
    fill_in :password,    with: "12345678"
    click_button('Sign In')
    click_link('postp')
    fill_in :message, with: "This is a peep from me"
    click_button('Post')
    expect(page).to have_content("This is a peep from me")
  end

end
