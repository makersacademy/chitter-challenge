feature 'viewing website' do
	scenario 'can see main page content' do 
		visit '/'
		expect(page).to have_content "Hello"
	end
end