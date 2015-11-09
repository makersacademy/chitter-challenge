require 'spec_helper'

feature 'Writing messages' do
	scenario 'Writing a message' do
		expect{write_message}.to change(Message, :count)
	end
end

feature 'Reading messaages' do
	scenario 'A message that I post is readable on the homepage' do
		write_message
		click_button('Sign out')
		expect(page).to have_content('Happy Friday')
		expect(page).to have_content('d9nny')
	end
end