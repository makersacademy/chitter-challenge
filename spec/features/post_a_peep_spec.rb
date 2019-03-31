require 'sign_up_helper'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a peep' do
  scenario "Users cannot peep if they aren't logged in" do
    visit '/'
    expect(page).not_to have_content "Peep your guts out!"
    expect(page).to have_content "Sign up or log in to start peeping"
  end

  scenario 'Users can peep if they are logged in' do
    sign_up 'Paul Martin', 'Hivemind', 'me@hotmail.com', 'password'
    visit '/'
    fill_in 'peep_content', with: "First peep w00t!!"
    click_button 'Peep'
    peeps = Peep.all
    expect(peeps.first.content).to eq "First peep w00t!!"
  end
end
