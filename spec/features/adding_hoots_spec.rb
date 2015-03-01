require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User adds a new hoot" do 

  before(:each) do
    User.create(:name => 'Test', :username => 'Test123', :email => "test@test.com", :password => 'test', :password_confirmation => 'test')
  end

  scenario "Once they have logged in" do 
    visit '/'
    sign_in('test@test.com', 'test')
    expect(page).to have_content("Welcome to your Parliament, Test123")
    add_hoot
    expect{ add_hoot }.to change(Hoot, :count).by(1)
  end

  def add_hoot(message = "Hoot Hoot!")
      fill_in "message", :with => message
      click_button 'Hoot to your Parliament'
  end
end