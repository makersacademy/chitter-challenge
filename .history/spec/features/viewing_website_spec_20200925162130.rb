feature 'viewing website' do
		scenario 'can see main page content' do 
				visit '/'
				expect(page).to have_content "Welcome to chitter!"
		end
end

feature 'website shows peeps' do
		scenario 'you can see all of the peeps' do
			visit '/peeps' 
			expect(page).to have_content "Well its friday!"
			expect(page).to have_content "Ready for the weekened?"
		end 
	end 

