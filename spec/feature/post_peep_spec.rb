require 'capybara/rspec'

feature "Posting peeps" do

  before(:each) do
    User.create(name: "Chidu", username: "Swagchief", email: "chidu@chidu.com", password: "12345")
  end

  scenario "Users are able to post peeps when signed in" do
    expect(Peep.count).to eq(0)

    sign_in("chidu@chidu.com", "123")
    peep("this is a test peep")
    expect(Peep.count).to eq(1)

    peep = Peep.get(1)

    expect(peep.message).to eq("this is a test peep")
    expect(page).to have_content("this is a test peep")
  end

  def sign_in email, password
    visit '/sessions/new'
    within('#sign-in-form') do
      fill_in "email", with: email
      fill_in "password", with: password
      click_button "Sign In"
    end
  end

  def peep msg
    visit '/'
    within('#post_peep') do
      fill_in "peep_message", with: msg
      click_button "Peep!"
    end
  end

end