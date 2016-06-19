feature 'New peep' do

	scenario 'signed in user can create a new peep' do
		signup
		signin
		visit('/peeps/new')
		fill_in(:content, with: 'The quick brown fox jumped over the lazy fox')
		click_button(:submit)
		expect(page).to have_content('The quick brown fox jumped over the lazy fox')
	end

	scenario 'displays the user who wrote the tweet' do
		signup
		signin
		visit('/peeps/new')
		fill_in(:content, with: 'The quick brown fox jumped over the lazy fox')
		click_button(:submit)
		expect(page).to have_content('The quick brown fox jumped over the lazy fox')
	end

	scenario 'non logged in users cannot peep' do
		visit('/peeps/new')
		fill_in(:content, with: 'The quick brown fox jumped over the lazy fox')
		click_button(:submit)
		expect(page).not_to have_content('The quick brown fox jumped over the lazy fox')
	end

# should display the date
# should display the user who wrote the peep


end