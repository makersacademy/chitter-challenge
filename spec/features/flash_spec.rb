feature "flash message" do
    it "flashes an error if username is already taken" do
      @test = Users.new(:name => "Anastasiia", :username => "@ana", :email => "ana@gmail.com", :password => "password")
      @test.save
      visit "/"
      fill_in 'username', with: '@ana'
      click_button "Submit"
      expect(page).to have_content("That username has already been taken, please sign in again")
    end
  
    it "flashes an error if email is already taken" do
      visit "/"
      fill_in 'email', with: 'ana@gmail.com'
      click_button "Submit"
      expect(page).to have_content("That email has already been taken, please sign in again")
    end
  end