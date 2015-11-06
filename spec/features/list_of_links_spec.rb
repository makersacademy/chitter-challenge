require 'spec_helper'

feature 'list of messages' do

  scenario 'shows a list of messages' do
  	Message.create( message: 'Makers Academy')
  	visit('/links')
  	expect(page.status_code).to eq 200
  	within 'ul#links' do
  		expect(page).to have_content "Makers Academy"
  	end
  end
end
