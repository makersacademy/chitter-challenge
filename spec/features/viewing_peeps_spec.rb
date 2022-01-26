feature 'viewing peeps(aka messages)' do 
  scenario 'peeps are displayed in reverse chronological order' do 
    # Add the test data (because through setup_test_database, the test table is cleared of entries before each test)
    #User.create(username: )
    
    Peep.add('Un ingeniero de software creó un juego para su pareja, ahora es una sensación en internet.')
    Peep.add('sjybarturn - the sound of the sea lapping peacefully against the shore, Norwegian.' )
    Peep.add('And theres a hand, my trusty fiere! And gies a hand o thine!')
    
    visit '/peeps'
    newest_peep = first('.peep') #looks for first element with class='peep'
    expect(newest_peep).to have_content('And theres a hand, my trusty fiere! And gies a hand o thine!')
    expect(newest_peep).to have_content('posted by: anonymous')
    
    expect(page).to have_content('sjybarturn - the sound of the sea lapping peacefully against the shore, Norwegian.')
  end

  scenario 'can post a peep without signing-in' do 
    visit '/peeps'
    fill_in :peep, with: 'test peep content with signed in user'
    click_button 'Post my peep'
     
    expect(page).to have_content('posted by: anonymous')
    expect(page).to have_content('test peep content with signed in user')
  end

  scenario 'if a signed-in user has posted a peep, their username and handle will display next to their peep' do 
    sign_up # signs up with username kbrooks3 and handle @kb
    fill_in :peep, with: 'test peep content with signed in user'
    click_button 'Post my peep'
   
    expect(page).to have_content('posted by: kbooks3, @kb')
    expect(page).to have_content('test peep content with signed in user')
  end
end