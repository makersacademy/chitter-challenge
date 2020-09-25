feature 'Viewing main page' do
	scenario 'can see main page content' do
		visit '/'
		expect(page).to have_content "hello?!"
	end 
end