# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Viewing peeps' do

  scenario 'user sees name, username, peep, timestamp' do
    
    user = User.create(name: 'My_name', username: 'My_username', email: 'someemail@gmail.com', password: 'fefwefwe')
    Peep.create(user_id: user.id, peep: "Hello world")
    Peep.create(user_id: user.id, peep: "Hello world again")
    
    visit '/peeps'

    expect(page).to have_content 'Hello world'
    expect(page).to have_content 'Hello world again'
  
  end

end
