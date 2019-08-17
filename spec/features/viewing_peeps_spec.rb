require 'pg'
require 'timecop'
require 'time'

feature 'viewing peeps' do
  scenario 'a user can see peeps on the homepage' do

    Peep.create(content: "This is the first peep", name: 'testname', username: 'testusername')
    Peep.create(content: "This is the second peep", name: 'testname', username: 'testusername')

    visit '/'
    expect(page).to have_content  "This is the first peep"
    expect(page).to have_content  "This is the second peep"
  end

  scenario 'a user can see the peeps in reverse chronological order' do

    Peep.create(content: "This is the first peep", name: 'testname', username: 'testusername')
    Peep.create(content: "This is the second peep", name: 'testname', username: 'testusername')

    visit('/')
    expect(all('li')[1].text).to have_content "This is the second peep"
  end

  scenario 'a user can see the username and name of the user who posted a peep' do

    User.create(email: 'test1@email.com', password: 'password123', username: 'un1', name: 'name1')
    User.create(email: 'test2@email.com', password: 'password123', username: 'un2', name: 'name2')
    visit '/sessions/new'
    fill_in(:email, with: 'test1@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')
    fill_in('content', with: "peep")
    click_button('submit')
    click_button('Sign Out')
    visit '/sessions/new'
    fill_in(:email, with: 'test2@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    expect(page).to have_content "un1"
  end

  feature 'a user can see the time each peep was posted' do
    before do
      Timecop.freeze(Time.now)
    end

    scenario 'a user can see the time each peep was posted' do

      Peep.create(content: "This is the first peep", name: 'testname', username: 'testusername')

      visit('/')
      expect(all('li')[0].text).to have_content Time.now.strftime("%H:%M")

    end
  end
end
