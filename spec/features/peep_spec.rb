# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Peep' do
  scenario 'Logged in user can post a message' do
    login
    click_link 'Post Peep'
    fill_in 'peep', with: 'This is a test post, Hello World!'
    click_button 'Peep'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Your Peep has been posted'
    expect(page).to have_content 'This is a test post, Hello World!'
  end
end
