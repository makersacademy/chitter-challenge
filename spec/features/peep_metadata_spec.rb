require 'sign_up_helper'

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'View time of peep' do
  scenario 'The time and date of a peep is displayed' do
    sign_up 'Paul Martin', 'Hivemind', 'me@hotmail.com', 'password'
    visit '/'
    fill_in 'peep_content', with: "This is my peep"
    click_button 'Peep'
    time = Peep.all[0].created_at
    expect(page.find('.peep')).to have_content(time.strftime('%-d %b, %H:%M%P'))
  end
end

# Not a user story, but from the exercise's "notes on functionality":
# - "Peeps have the name of the maker and their user handle."

feature 'View author of peep' do
  scenario "The name of a peep's author is displayed" do
    sign_up 'kRkUPVq3RWxBb8hp', 'Hivemind', 'me@hotmail.com', 'password'
    visit '/'
    fill_in 'peep_content', with: "This is my peep"
    click_button 'Peep'
    click_button 'Log out'
    expect(page).to have_content 'kRkUPVq3RWxBb8hp'
  end

  scenario "The username of a peep's author is displayed" do
    sign_up 'Paul Martin', 'thOKNXS4hHvojhHi', 'me@hotmail.com', 'password'
    visit '/'
    fill_in 'peep_content', with: "This is my peep"
    click_button 'Peep'
    click_button 'Log out'
    expect(page).to have_content 'thOKNXS4hHvojhHi'
  end
end
