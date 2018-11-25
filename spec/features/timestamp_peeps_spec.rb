feature 'Peeps are timestamped' do
	scenario 'A user can see the date and time a peep was made' do
		User.create(
  		username: 			"Test Usrname",
  		email: 					"test@test.com",
  		first_name: 		"Test",
  		last_name: 			"Account",
  		)
  	Peep.create(
  		message_content: 	"I am a peep",
  		created_at: 			Time.new(2018, 01, 01, 23, 0, 0),
  		author: 					"Test Account",
  		user_id: 					1
  		)
  	visit ('/')
  	within ".timeline" do
    	expect(find("li:first-child").text).to have_content("01 January 2018, 2300")
    end
  end
end