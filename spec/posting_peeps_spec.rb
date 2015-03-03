require 'spec_helper'

feature "User posts a new Peep" do

  before(:each) do
    User.create(:email => 'test@test.com',
                :username => 'Test',
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "when on the homepage" do
    visit('/')
    sign_in('test@test.com', 'Test', 'test')
    expect(Peep.count).to eq(0)
    post_peep("Hello Chitter!")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq("Hello Chitter!")
  end

  def post_peep(text)
      visit('/')
      fill_in 'text', :with => text
      click_button "post"
  end

  def sign_in(email, username, password)
      visit('/sessions/new')
      fill_in 'email', :with => email
      fill_in 'username', :with => username
      fill_in 'password', :with => password
      click_button "Sign in"
  end

  def sign_up(email = "aporkinson@gmail.com",
              password = "letmein",
              password_confirmation = 'letmein')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end
