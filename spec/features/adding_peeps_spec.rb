require 'spec_helper'
require_relative 'helpers/session'


feature 'user adds a new peep' do

  include SessionHelpers

  before(:each) do
    User.create(:username => "Chris",
                :email => "chris@chris.com",
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario "adding a new peep" do
    sign_in('chris@chris.com', 'password')
    expect(Peep.count).to eq(0)
    add_peep("Just adding a peep", DateTime.now)
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.author).to eq("Chris")
  end

  def add_peep(content, time=DateTime.now)
    within('#new-peep') do
      fill_in 'content', :with => content
      click_button 'Peep!'
    end
  end

end