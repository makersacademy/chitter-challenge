require 'spec_helper'

feature 'User send message' do 

  scenario "sending a message" do 
    visit '/user'
    fill_in :content, :with => "Hello, World!"
    click_on("submit message")
    expect(page).to have_content("Hello, World!")
  end
end