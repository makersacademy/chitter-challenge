feature  'see peeps in reverse chronological order' do 
	scenario 'reverse chronological order' do 
		register
  	log_in
  	peep
		fill_in('content', with: "This is my second peep")
		click_button('Peep!')
  	expect("This is my second peep").to appear_before("This is my first peep")
	end

end