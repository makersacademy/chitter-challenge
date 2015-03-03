require 'spec_helper'

require_relative 'helpers/session'
include SessionHelpers

feature "Maker browses a list of peeps" do

  before(:each) do

    Maker.create( :name => "Snow White",
                  :username => "red_apple",
                  :email => "snow_white@example.com",
                  :password => "seven_dwarfs",
                  :password_confirmation => "seven_dwarfs")

    sign_in('red_apple', 'seven_dwarfs')
      add_peep( :message => "Hello Chitter!")
      add_peep( :message => "Hola Chitter!")
      add_peep( :message => "Bonjour Chitter!")
    sign_out
  end

  scenario "when opening the homepage" do
    visit '/'
    expect(page).to have_content("Hello Chitter!" && "Hola Chitter!" && "Bonjour Chitter!")
  end

  # scenario "displayed in chronological order" do
  # end

end