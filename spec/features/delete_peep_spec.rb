feature 'posting peeps(aka messages)' do 
  scenario 'a user can post a new peep and then delete it' do 
    sign_up
    
    fill_in('peep', with: 'Hey, here is a test peep that I then want to delete')
    click_button('Post my peep')
    expect(page).to have_current_path('/peeps')

    expect(page).to have_content('Hey, here is a test peep that I then want to delete')
    click_button('Delete this peep')
    
   
    expect(page).not_to have_content('Hey, here is a test peep that I then want to delete')
  
  end

  scenario 'user can only delete their own peeps' do 
    User.create(username: 'testuser1', handle: '@test',  password: 'password123')
       
    sign_up # signs up with username kbrooks3 and handle @kb
    fill_in :peep, with: 'peep from first user signed in'
    click_button 'Post my peep'
    click_button 'Sign out'
    
    visit 'sessions/new'
    # fill in username and pw correctly:
    fill_in(:username, with: 'testuser1')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content('peep from first user signed in')
    expect(page).not_to have_content('delete')
    
  end
end