describe "User Profile" do

  email = "joemaidman@gmail.com"
  handle = "joe"
  password = "password"
  message = 'Hell there!!'

  before(:each) do
    sign_up(email: email, handle: handle, password: password)
    sign_in(email: email, password: password)
    create_peep(message: message)
  end

  feature 'user wants to see their profile page' do
    scenario 'profile' do
      user = User.first
      peep = Peep.first
      visit "/users/#{user.id}"
      expect(page.status_code).to be(200)
      expect(page).to have_content("#{user.handle}")
      expect(page).to have_content("#{user.email}")
      expect(page).to have_content("#{user.bio}")
      expect(page).to have_css("img[src*='#{user.avatar}']")
      expect(page).to have_content("Peep count 1")
      expect(page).to have_content("#{handle} on #{peep.date.strftime('%A, %d %b %Y')} @ #{peep.date.strftime('%l:%M %p')}")
      expect(page).to have_content("#{peep.message}")
    end
  end

end
