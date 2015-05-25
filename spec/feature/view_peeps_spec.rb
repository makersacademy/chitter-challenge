require 'capybara/rspec'

feature "Viewing peeps" do

  before(:each) do
    user = User.create(name: 'Ptolemy', email: 'theking@gmail.com', password: 'secret1234', username: 'Chitter King')
    3.times {|id| user.peep.create(message: "peep #{id+1}") }
  end

  scenario "users can view peeps in reverse chronological order" do
    sign_in("theking@gmail.com","secret1234")
    expect(page).to have_content("Chitter King peep 3 Chitter King peep 2 Chitter King peep 1")
  end

  def sign_in email, password
    visit '/sessions/new'
    within('#sign-in-form') do
      fill_in "email", with: email
      fill_in "password", with: password
      click_button "Sign In"
    end
  end

end