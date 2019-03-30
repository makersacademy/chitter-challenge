# Testing the viewing of pees when user hits '/' route

feature 'Viewing peeps' do
  scenario 'when visiting the index page' do
    visit '/'
    expect(page).to have_content 'Chitter app - Peeps'
  end

  scenario 'user sees name, handle, peep, timestamp ot peeps when visiting the peeps page' do
    
    user = User.create(name: 'My_name', username: 'My_username', email: 'someemail@gmail.com', password: 'fefwefwe')
    Peep.create(user_id: user.id , peep: "Hello world")
    Peep.create(user_id: user.id , peep: "Hello world again")
    
    visit '/peeps'

    expect(page).to have_content 'Hello world'
    expect(page).to have_content 'Hello world again'
    expect(page).to have_content 'My_name'

  end
end