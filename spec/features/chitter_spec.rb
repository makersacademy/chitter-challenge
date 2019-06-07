require './app.rb'
require 'pg'

feature 'display' do
  connection = PG.connect(dbname: 'chitter_test')

  scenario 'can display the main Chitter board' do
    visit '/'
    expect(page).to have_css('h2', text: "Peep Board")
  end

  scenario 'can display a peep on the board' do
    connection.exec("insert into peeps (name, content, time_stamp) values
    ('Name1', 'Content1', NOW());")
    visit '/'
    expect(page).to have_content("Name1: Content1")
  end

  scenario 'can view the create peep page' do
    visit '/'
    click_link 'Add'
    expect(page).to have_css('h2', text: "Add Peep")
  end

  scenario 'can display a recently added peep' do
    visit '/'
    click_link 'Add'
    fill_in 'name', with: "Test Name"
    fill_in 'content', with: "This is some content for a peep. This is a test."
    click_button 'Post'
    expect(page).to have_content("Test Name: This is some content for a peep. This is a test.")
  end

  scenario 'can get to the sign up page' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_css('h2', text: 'Join us!')
    expect(page).to have_css('h3', text: 'Sign up')
  end

  scenario 'can get to the sign up page' do
    visit '/'
    click_link 'Sign up'
    fill_in 'name', with: 'Name'
    fill_in 'username', with: 'username'
    fill_in 'password', with: 'fakepass123'
    click_button id='signUpSubmit'
    expect(page).to have_content("Hi Name!")
  end


end
