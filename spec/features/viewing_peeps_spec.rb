feature 'viewing peeps(aka messages)' do 
  scenario 'a user can view peeps' do 
      # Add the test data (because through setup_test_database, the test table is cleared of entries before each test)
      Peep.add(content: 'Un ingeniero de software creó un juego para su pareja, ahora es una sensación en internet.', user: 'kbrooks', handle: '@kb')
      Peep.add(content: 'sjybarturn - the sound of the sea lapping peacefully against the shore, Norwegian.', user: 'rmacfarlane', handle: '@rmac')
      Peep.add(content: 'And theres a hand, my trusty fiere! And gies a hand o thine!', user: 'robertburns', handle: '@burns')

      visit '/peeps'
  
      expect(page).to have_content('kbrooks')
      expect(page).to have_content('@kb')
      expect(page).to have_content('Un ingeniero de software creó un juego para su pareja, ahora es una sensación en internet.')
  end
end