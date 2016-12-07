# require 'spec_helper'
# require "./app/models/peep"
#
# feature 'Adding time to peeps' do
#   scenario 'I can see the time when a peep was created' do
#     visit '/peeps/new'
#     fill_in 'title', :with => 'Hello'
#     fill_in 'message', :with => 'First peep, Ed Balls'
#     fill_in 'time', with: Time.now
#     click_button 'Add Peep'
#     peep = Peep.first
#     expect(page).to have_content(Time.now)
#   end
# end
