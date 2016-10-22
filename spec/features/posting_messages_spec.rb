feature 'posting a message' do
	scenario 'when signed in' do
		create_user(:name,
								:'email@email.com',
								:username,
								:password,
								:password)
		post_message("Example message")
		puts page.html
		user = User.first
		expect(page).to have_content "Example message"
		#expect(user.messages.map(&:body)).to include("Example message")
	end
end