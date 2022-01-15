feature 'viewing posts' do 
  scenario 'a user can view posts' do 
      #Post.create(user: "kbrooks", handle: '@kb', content: 'test chitter post') #refactored this (previously we connected to the test db and inserted dummy test data urls. But now that the Model Bookmark class has a way of inserting data to the real db, we can do it this way instead)
      #Post.create(url: "http://www.google.com", title: 'Google')
      #Post.create(url: "http://www.destroyallsoftware.com", title: 'Dangerous website!')
  
      visit '/posts'
  
      expect(page).to have_content('kbrooks')
      expect(page).to have_content('@kb')
      expect(page).to have_content('test chitter post')
  end
end