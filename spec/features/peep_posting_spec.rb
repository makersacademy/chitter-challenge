require 'spec_helper'
require_relative '../web-helper'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "Posting peeps" do
  scenario "I want to post a peep to chitter" do
      sign_up
      log_in
      peep
      expect(page.current_path).to eq '/peeps'
      expect{peep}.to change(Peep, :count).by(1)
      expect(page).to have_content "This is my first peep. And what a peep it is."
  end

  scenario "I don't want to be able to post a peep if i am not logged in" do
    peep
    expect(page.current_path).to eq '/peeps'
    expect{peep}.to_not change(Peep, :count)
    expect(page).to_not have_content "This is my first peep. And what a peep it is."
  end
end
