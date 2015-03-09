ENV['RACK_ENV'] = 'test'

  Given(/^I am on the homepage$/) do
    visit '/'
  end

  When(/^I click on Sign up$/) do
    click_link('Signup')
  end

  Then(/^I can enter "(.*?)", "(.*?)", "(.*?)" and "(.*?)"$/) do |arg1, arg2, arg3, arg4|
    expect(page).to have_content(arg1)
    expect(page).to have_content(arg2)
    expect(page).to have_content(arg3)
    expect(page).to have_content(arg4)
  end


  Then(/^I can see "(.*?)"$/) do |arg1|
    expect{ sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq("thomas@strothjohann.net")
    expect(page).to have_content("Welcome, TStrothjohann!")
  end


  Given(/^I have an account already$/) do
    sign_up
  end

  When(/^I log in with username and password$/) do
    sign_in("thomas@strothjohann.net", "test")
  end

  Then(/^I should see the Chitter\-editor on frontpage$/) do
    visit('/messages/new') 
    expect(page).to have_content('Write a message')
  end

  Then(/^I can read messages in chronological order$/) do
    publish_message
    visit('/')
    expect(page).to have_content("Oh, hello! This is a test tweet")
  end



  def sign_in(username, password)
    visit '/sessions/new'
    fill_in 'auth', :with => username
    fill_in 'password', :with => password
    click_button 'log in'
  end


  def sign_in2(email, password)
    visit '/sessions/new'
    fill_in 'auth', :with => email
    fill_in 'password', :with => password
    click_button 'log in'
  end


  def sign_up
    visit '/users/new'
    fill_in :name, :with => "Thomas1"
    fill_in :username, :with => "TStrothjohann"
    fill_in :email, :with => "thomas@strothjohann.net"
    fill_in :password, :with => "test"
    fill_in :password_confirmation, :with => "test"
    click_button "signup"
  end

  def publish_message
    sign_up
    click_link('Create message')
    fill_in 'text', :with => "Oh, hello! This is a test tweet"
    click_button 'publish'
  end
