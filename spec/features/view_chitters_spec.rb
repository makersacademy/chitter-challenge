feature "FEATURE: view chitters" do

  let(:name) { 'J T Kirk' }
  let(:email) { 'JTK@test.com' }
  let(:user_name) { 'TheShat' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }
  let(:peep_user_id) { 1 }
  let(:peep_text) { "Second star to the right and straight on 'til morning." }

  context "user created with one peep" do
    before do
      user = User.create(name: name, email: email, user_name: user_name, password: password, password_confirmation: password_confirmation)
      user.peeps.create(peep_text: peep_text)
    end

    scenario "can see peeps on home page" do
      visit('/')
      within('#peeps-container') do
        expect(page).to have_content(peep_text)
      end
    end

    scenario "peep contains user's name and username" do
      visit('/')
      within('#peeps-container') do
        expect(page).to have_content(name)
        expect(page).to have_content(user_name)
      end
    end
  end

  scenario "peeps have a timestamp" do
    Timecop.freeze do
      user = User.create(name: name, email: email, user_name: user_name, password: password, password_confirmation: password_confirmation)
      user.peeps.create(peep_text: "Peep at frozen time")
      visit('/')
      within('#peeps-container') do
        expect(page).to have_content(Time.now.strftime("%l:%M%P on %d/%m/%Y"))
      end
    end

  end

end
