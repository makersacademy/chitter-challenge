feature 'Sign up' do
	scenario 'user can sign up with name, username, email and password' do
		expect { sign_up }.to change { User.count }.by 1
	end

	scenario 'user sees usersname on creets page after sign up / in' do
		sign_up
		expect(page).to have_content 'Hi SuperSteve4Prez!'
	end
end
