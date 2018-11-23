feature 'Viewing peeps' do
  scenario 'A user can view peeps' do
  	User.create(
  		username: 			"Test Usrname",
  		email: 					"test@test.com",
  		first_name: 		"Test",
  		last_name: 			"Account",
  		date_of_birth: 	"010191"
  		)
  	Peep.create(
  		message_content: 	"I am a peep",
  		created_at: 			Time.now,
  		author: 					"Test Account",
  		user_id: 					1
  		)
  	Peep.create(
  		message_content: 	"I am also a peep",
  		created_at: 			Time.now,
  		author: 					"Test Account",
  		user_id: 					1
  		)
    visit('/')
    expect(page).to have_content "I am a peep"
    expect(page).to have_content "I am also a peep"
  end

  scenario 'Peeps should be shown in reverse chronological order' do
  end
end