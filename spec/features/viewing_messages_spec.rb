feature "viewing messages" do
  
    scenario "a user can see all messages" do
    
    #   connection = PG.connect(dbname: 'chitter_test')
  
      # Add the test data
      Message.create(msg: "hello world")
      Message.create(msg: "i love kimchi")
      Message.create(msg: "donuts, amirite?")
  
      visit '/messages'
  
      expect(page).to have_content("hello world")
    end
  end