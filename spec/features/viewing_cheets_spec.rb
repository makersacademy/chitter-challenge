require 'spec_helper'

feature 'Viewing cheets' do
	
  scenario 'I can see my cheets on the cheets page' do
  	Cheets.create(message: 'Something I want to let the Chitter World know.', time: DateTime.now)
  	visit '/cheets'
  	expect(page.status_code).to eq 200
  	expect(page).to have_content('Something I want to let the Chitter World know.')
  end
end
