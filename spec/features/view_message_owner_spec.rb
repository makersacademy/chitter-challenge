feature 'view message owner' do
	scenario 'every message shows which user it\'s posted by' do
		sign_up
		Message.create(text: "Just read the metamorphisis.", time: "22:22:22")
		visit '/creets'
		expect(page).to have_content "SuperSteve4Prez posted at 22:22:22"
	end
end
