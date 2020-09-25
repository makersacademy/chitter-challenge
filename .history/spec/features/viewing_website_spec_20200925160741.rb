feature 'viewing website' do
	scenario 'can see main page content' do 
		visit '/'
		expect(page).to have_content "Welcome to chitter!"
	end
end