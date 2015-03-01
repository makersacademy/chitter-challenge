require 'spec_helper'

require_relative 'helpers/session'

feature "User adds a new peep" do

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
    expect(Peep.count).to eq(0)
    visit '/'
    post_peep("This is my second peep")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq("This is my second peep")
  end

  def post_peep(text)
    within('#new-peep') do
      fill_in 'text', :with => text
      click_button 'Peep'
    end
  end
end