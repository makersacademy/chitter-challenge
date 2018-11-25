feature 'Posting a peep' do
	scenario 'A user should be able to post a peep' do
		test_user = User.create(
  		username: 			"Test Usrname",
  		email: 					"test@test.com",
  		first_name: 		"Test",
  		last_name: 			"Account",
  		)
		visit('/new_peep')
		fill_in('message_content', with: 'I am a new peep')
		click_on('Post')
		within ".timeline" do
			expect(find("li:first-child").text).to have_content("I am a new peep")
		end
  end
end
