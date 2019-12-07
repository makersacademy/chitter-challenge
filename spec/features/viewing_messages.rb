feature "viewing messages" do
  
    scenario "a user can see all messages" do
    
    #   connection = PG.connect(dbname: 'chitter_test')
  
      # Add the test data
      Bookmark.create(msg: "hello world")
      Bookmark.create(msg: "i love kimchi")
      Bookmark.create(msg: "donuts, amirite?")
  
      visit '/messages'
  
      expect(page).to have_content("hello world")
    end
  end