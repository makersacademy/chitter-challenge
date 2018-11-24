feature 'Posting a peep' do
	scenario 'A user should be able to post a peep' do
		visit('/')
		click_on("Post a Peep")
		expect(page).to have_current_path('/new_peep')
		fill_in('message_content', with: 'I am a new peep')
		click_on('Post')
		expect(page).to have_content('I am a new peep')
  end
end