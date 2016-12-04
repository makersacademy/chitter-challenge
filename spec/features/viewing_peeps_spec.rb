require 'spec_helper'

RSpec.feature 'viewing peeps', :type => :feature do

	include Helpers

	let!(:user) do
		User.create(firstname: 'John',
			surname: 'Doe',
			email: 'john@doe.com',
			username: 'JayDawg',
			password: 'password123',
			password_confirmation: 'password123')
	end
	
	scenario 'see peeps that have been submitted' do
		Peep.create(firstname: user.firstname,
			surname: user.surname,
			username: user.username,
			text: 'Hello world!')
		visit '/peeps'
		expect(page.status_code).to eq 200
		
		within 'ul#peeps' do
			expect(page).to have_content('John Doe @JayDawg')
			expect(page).to have_content('Hello world!')
		end
	end
end
