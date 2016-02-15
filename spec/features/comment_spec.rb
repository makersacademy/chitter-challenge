feature  'comments' do 
	scenario 'wrtie a comment' do 
		register
  	log_in
  	peep
		fill_in('comment', with: "This is my comment")
		click_button('reply')
  	expect(page).to have_content("This is my comment")
	end

end