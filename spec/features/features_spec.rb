feature 'Features - Chitter' do

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  scenario 'user sends a peep to chitter' do
    visit('/send_peep')
    fill_in :peep, with: 'my first peep, hurray!'
    click_button 'Submit'
  end

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'user wants to see all peeps' do
    Peep.create(peep: 'my first peep, hurray!')
    Peep.create(peep: 'my second peep, hurray!')
    visit('/all_peeps')
    expect(page).to have_content('my first peep, hurray!')
    expect(page).to have_content('my second peep, hurray!')
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario 'user wants to see when a peep was sent' do
    visit('/all_peeps')
    peep = Peep.create(peep: 'my first peep, hurray!')
    expect(page).to have_content('sent at')
  end


  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario 'user wants to sign up' do
    visit('/')
    click_button 'Sign up'
    visit('/signup')
    fill_in :username, with: 'chocolatine'
    fill_in :name, with: 'Mathilde'
    fill_in :email, with: 'mathilde@email.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'
  end

end
