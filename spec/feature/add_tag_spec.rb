feature 'Add tag' do

  scenario 'User can tag another user in a peep' do 
    user1 = User.create(name: 'Momo', username: 'momo', email: 'momo@gmail.com', password: 'fefwefwe')
    usee2 = User.create(name: 'Coco', username: 'coco', email: 'coco@gmail.com', password: 'fefwefwe')
    
    visit '/'
    
    click_button 'login'

    fill_in "user",	with: "momo" 
    fill_in "pass",	with: "fefwefwe" 

    click_button 'Log in'

    click_button 'New peep'

    fill_in "peep",	with: "This is my peep @coco said @momo"
    
    click_button 'send peep'

    expect(page).to have_content 'We have a match'

  end

end