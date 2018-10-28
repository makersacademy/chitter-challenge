require 'pry'
feature 'testing infrastructure' do

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter

  scenario "Can cheet and see it" do
    visit '/'
    fill_in :text_box, with: "testing123"
    click_button 'Cheet'
    expect(page).to have_content "testing123"
  end

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  # end
  scenario 'cheets are shows in reverse' do
    visit '/'
    fill_in :text_box, with: "Entered Second"
    click_button 'Cheet'
    cheets = Cheet.all
    #  HELP NEEDED TO TEST FOR
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario 'timestamp shown with cheet' do
    visit '/'
    fill_in :text_box, with: "timecheck"
    click_button 'Cheet'
    current_time = Time.now
    expect(page).to have_content("timecheck Anonymous : #{current_time}")
  end

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter?
  
  scenario 'can sign up to chitter so comments have user' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_current_path '/signup'
    fill_in :username_box, with: 'Felix'
    fill_in :password_box, with: 'password123'
    click_button "Sign up"
    fill_in :text_box, with: 'I roar like cheetah, rawr'
    click_button 'Cheet'
    expect(page).to have_content("I roar like cheetah, rawr Felix")
  end

  # As a Maker
  # So that only I can post messages on Chitter as me
  # I want to log in to Chitter
  scenario 'can log in to chitter' do
    visit '/'
    click_button 'Log in'
    expect(page).to have_current_path '/login'
    fill_in :username_box, with: 'existingUser'
    fill_in :password_box, with: 'hushhush'
    click_button "Log in"
    fill_in :text_box, with: 'I am a robot'
    click_button 'Cheet'
    expect(page).to have_content("I am a robot existingUser")
  end
end
