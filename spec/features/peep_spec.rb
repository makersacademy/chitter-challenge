require 'spec_helper'
require_relative 'helpers/session'

require_relative 'helpers/session'
include SessionHelpers

feature "Maker posts a peep" do

  before(:each) do
    Maker.create( :name => "Snow White",
                  :username => "red_apple",
                  :email => "snow_white@example.com",
                  :password => "seven_dwarfs",
                  :password_confirmation => "seven_dwarfs")
  end

  scenario "when browsing the homepage" do
    sign_in('red_apple', 'seven_dwarfs')
<<<<<<< HEAD
    expect{add_peep("Hello Chitter!")}.to change{Peep.count}.by(1)
=======
    expect{add_peep("Hello Chitter!", "Snow White", "seven_dwarfs")}.to change{Peep.count}.by(1)
>>>>>>> 5bdcd6673094af0dc6db659170887ed1cd1518ea
  end

  scenario "only when signed in" do
    visit ('/')
    expect(page).not_to have_content("What's Peepin'?:")
    sign_in('red_apple', 'seven_dwarfs')
    expect(page).to have_content("What's Peepin'?:")
  end

<<<<<<< HEAD
=======
  def add_peep(message, name, username)
      within('.new-peep') do
      fill_in 'message', :with => message
      click_button 'Peep!'
    end
  end
>>>>>>> 5bdcd6673094af0dc6db659170887ed1cd1518ea


end


# feature "Maker replies to a peep" do

#   scenario "when on the homepage" do
#   end

# end

