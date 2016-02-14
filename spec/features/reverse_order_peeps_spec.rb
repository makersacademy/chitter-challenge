feature  'see peeps in reverse order' do 
	scenario 'reverse order' do 
		register
  	log_in
  	peep
		fill_in('content', with: "This is my second peep")
		click_button('Peep!')
  	expect("This is my second peep").to appear_before("This is my first peep")
	end

end