require 'spec_helper'

require_relative 'helpers/session'

feature "User responds to a peep" do

  include SessionHelpers

   before(:each) do
    User.create(:name => 'tester',
                :username => 'username_test',
                :email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
    end

  scenario "when logged in and browsing the homepage" do
    sign_in('test@test.com', 'test')
    visit '/peeps/new'
    fill_in :text, :with => "This is my second peep"
    click_button 'Peep'
    click_button 'Respond'
    fill_in :response, :with => "This is my response"
    expect(Peep.response.count).to eq(1)
    expect(Peep.response.first.text).to eq("This is my second peep")
  end


end