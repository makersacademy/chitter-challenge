feature 'User can post a messages (peep) to chitter' do
  scenario 'user visits a message board' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'users can add messages to the notice board' do
    sign_up
    post_new_message
    expect(current_path).to eq '/messages'
    expect(page).to have_content '#ScarfsForBears'
  end
end
