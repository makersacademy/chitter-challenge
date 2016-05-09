feature 'peeps to add the site' do
	scenario 'save peeps' do
	visit '/peeps/new'
		fill_in :peep, with: 'Hello World'
    click_button 'Submit'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Hello World')
    end
	end
end