# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting messages' do

  scenario 'posted first message appears' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!!!"
    # expect(page).to have_content "Please submit your first messsage"
    fill_in :message, with: 'hello everyone!'
    click_button 'Submit'
    # visit('/enter')
    expect(page).to have_content 'hello everyone!'
  end

end
