#require 'pg'
require 'timecop'

feature 'Viewing hompage' do
  scenario 'A user can see peeps' do
    visit('/')
    expect(page).to have_content "Timeline"
  end
end
feature 'sign up to chitter' do
  scenario 'user sign up with email and password' do
    visit '/chitter'
    fill_in 'name', with: "RebeccaMulugeta"
    fill_in 'email', with: "becc.mulugeta@gmail.com"
    fill_in 'password', with: "password123"
    click_button 'Sign Up'
    expect(page).to have_content "Welcome to Chitter"
    expect(page).to have_content "Hello RebeccaMulugeta"
  end
end

feature 'Viewing peeps' do
  scenario 'Users can view peeps and timestamps in reverse chronological order' do
    Timecop.freeze(time = Time.now) do
        Peep.create(message: 'Second peep is also here!', created_at: time)
        Peep.create(message: 'First peep here!', created_at: time)
      end
      visit('/chitter')
      peep = Peep.new(message: message, created_at: created_at)
      expect(page).to have_content("#{peep.message} #{peep.created_at}")
 #      expect(page).to have_content("Second peep is also here!
 # Posted date: #{time.strftime("%Y-%m-%d %k:%M")}\nFirst peep here! Posted date: #{time.strftime("%Y-%m-%d %k:%M")}")
  end
  end
