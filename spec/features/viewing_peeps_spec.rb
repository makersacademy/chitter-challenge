feature 'Viewing peeps(messages)' do
  scenario 'So a user can see the messages posted on Chitter' do
    visit('/chitter')
    # fill_in 'title', with: 'Title 1'
    # fill_in 'peep', with: 'Hello Chitter, this is my first test message!'
    # click_button 'Submit'
    
    expect(current_path).to eq '/chitter'
    # expect(page).to have_content('Title 1')
    expect(page).to have_content('Hello Chitter, this is my first message!')
  end
end