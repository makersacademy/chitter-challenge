require 'spec_helper'

feature "Maker posts a peep" do

  scenario "when browsing the homepage" do
    visit '/'
    expect{add_peep("Hello Chitter!", "Snow White", "seven_dwarfs")}.to change{Peep.count}.by(1)
  end

  end

  def add_peep(message, name, username)
    within('#new-peep') do
      fill_in 'message', :with => message
      click_button 'Peep!'
    end
  end

  # scenario "only when logged in" do
  # end


# feature "Maker replies to a peep" do

#   scenario "when on the homepage" do
#   end

# end

