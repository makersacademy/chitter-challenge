feature 'user can post a message (peep) to chitter' do
  scenario 'user visits a message board' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter, the best replacement to Twitter'
  end

  scenario 'user can add messages to the board' do
    post_new_message
    expect(current_path).to eq '/messages'
    expect(page).to have_content 'MA Chitter is a cool app'
 end
end
