feature 'Add peeps' do
  
  scenario 'user can add a peep to the board if he has an account' do
    user = User.create(name: 'My_name', username: 'My_username', email: 'someemail@gmail.com', password: 'fefwefwe')
    visit '/'
    
    click_button 'login'

    fill_in "user",	with: "My_username" 
    fill_in "pass",	with: "fefwefwe" 


    click_button 'Log in'
    click_button 'New peep'
    fill_in "peep",	with: "This is my peep"
    
    click_button 'send peep'

    expect(page).to have_content 'This is my peep'

  end

end