feature 'Signing in' do
	scenario 'providing the correct details' do
		example_user = create_user(:name,:'email@email.com',:username,:password,:password)
		sign_in(:'email@email.com',:password)
		expect(page).to have_content "You are signed in as name"
	end

	scenario 'providing the wrong details' do
		create_user(:name,:'email@email.com',:username,:password,:password)
		sign_out
		sign_in(:'email@email.com',:wrong_password)
		expect(page).to have_content "The email or password is incorrect"
	end
end