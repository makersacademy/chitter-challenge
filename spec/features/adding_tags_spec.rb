# require 'spec_helper'
#
# feature 'creating links with tags' do
#
#   scenario 'allows you to create a link and add a new link' do
#     visit('/links/new')
#     fill_in(:message, with: 'Makers Academy')
#     fill_in(:url, with: 'https://www.makersacademy.com')
#     fill_in(:name, with: 'cool')
#     click_button('Submit')
#     link = Link.first
#     expect(link.tags.map(&:name)).to include('cool')
#   end
#
#   scenario 'I can add multiple tags to a new link' do
# 	  visit '/links/new'
# 	  fill_in 'url',   with: 'http://www.makersacademy.com/'
# 	  fill_in 'message', with: 'Makers Academy'
# 	  # our tags will be space separated
# 	  fill_in 'name',  with: 'education ruby'
# 	  click_button 'Submit'
# 	  link = Link.first
# 	  expect(link.tags.map(&:name)).to include('education', 'ruby')
# 	end
# end
