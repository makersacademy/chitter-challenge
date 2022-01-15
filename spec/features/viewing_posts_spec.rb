feature 'viewing peeps(aka messages)' do 
  scenario 'a user can view peeps' do 
      #Post.create(user: "kbrooks", handle: '@kb', content: 'test chitter post') #refactored this (previously we connected to the test db and inserted dummy test data urls. But now that the Model Bookmark class has a way of inserting data to the real db, we can do it this way instead)
      #Post.create(url: "http://www.google.com", title: 'Google')
      #Post.create(url: "http://www.destroyallsoftware.com", title: 'Dangerous website!')
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps VALUES(1, 'Un ingeniero de software creó un juego para su pareja, ahora es una sensación en internet.', 'kbrooks', '@kb');")
      connection.exec("INSERT INTO peeps VALUES(2, 'sjybarturn - the sound of the sea lapping peacefully against the shore, Norwegian.', 'rmacfarlane', '@rmac');")
      connection.exec("INSERT INTO peeps VALUES(3, 'And theres a hand, my trusty fiere! And gies a hand o thine!', 'robertburns', '@burns');")

      visit '/peeps'
  
      expect(page).to have_content('kbrooks')
      expect(page).to have_content('@kb')
      expect(page).to have_content('Un ingeniero de software creó un juego para su pareja, ahora es una sensación en internet.')
  end
end