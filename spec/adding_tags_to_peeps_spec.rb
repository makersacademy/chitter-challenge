require 'spec_helper'

feature "User adds tags" do
  scenario "with a few tags" do
    visit "/"
    add_peep("Hello")
    peep = Peep.first
  end

  def add_peep(message, tag = [])
    within('#new-peep') do
      fill_in 'message', :with => message
      click_button 'Post peep'
    end
  end
end