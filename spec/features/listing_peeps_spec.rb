require 'spec_helper'


feature "Maker browses a list of peeps" do

  before(:each){
    Peep.create(:message => "Hello Chitter!",
                :name => "Snow White",
                :username => "red_apple")

    Peep.create(:message => "Hola Chitter! Cómo estás?",
                :name => "Cinderella Relli",
                :username => "magic_slipper")

    Peep.create(:message => "Bonjour Chitter! Comment allez-vous?",
                :name => "Princess Aurora",
                :username => "sleeping_beauty")
  }

  scenario "when opening the homepage" do
    visit '/'
    expect(page).to have_content("Hello Chitter!")
  end

  # scenario "displayed in chronological order" do
  # end


end
