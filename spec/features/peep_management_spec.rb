# User Story currently being tested:

# As a maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter


feature 'Peeps shown on website' do

  def sign_up(name="Ashleigh Smells",
              username="ashleighpants",
              email="ash@ash.com",
              password="pass",
              password_confirmation="pass")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  def add_peep peep_text
    fill_in 'peep_text', with: peep_text
    click_button 'Peep Peep!'
  end

  scenario 'Peeps can be posted on website' do
    expect(Peep.count).to eq 0
    sign_up
    add_peep 'This is my first peep, people'
    expect(Peep.count).to eq 1
    expect(Peep.first.peep_text).to eq 'This is my first peep, people'
    expect(Peep.first.username).to eq 'ashleighpants'
    expect(Peep.first.name).to eq 'Ashleigh Smells'
  end

end

# feature 'User tries to post a peep' do

#   def sign_up(name="Ashleigh Smells",
#               username="ashleighpants",
#               email="ash@ash.com",
#               password="pass",
#               password_confirmation="pass")
#     visit '/users/new'
#     expect(page.status_code).to eq 200
#     fill_in :name, with: name
#     fill_in :username, with: username
#     fill_in :email, with: email
#     fill_in :password, with: password
#     fill_in :password_confirmation, with: password_confirmation
#     click_button 'Sign Up'
#   end

#   scenario 'When signed in' do

#   end

#   scenario 'When not signed in' do
#   end
  
# end