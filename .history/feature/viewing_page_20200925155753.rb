feature 'Viewing chitters' do 
	scenario 'main page has chitter content' do
	visit '/' 
	expect(page).to have_content "NOt Welcome to chitter!"
	end 
end 
