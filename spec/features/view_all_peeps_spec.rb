require 'spec_helper'

feature 'View all peeps' do
	scenario 'Ensure all peeps are displayed' do
		visit('/peeps')
		all_peeps = Peep.all.count
		expect(page).to have_selector('li', count: all_peeps)
	end
end