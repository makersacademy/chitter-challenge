feature 'user can post a message (peep) to chitter' do
  scenario 'user visits a message board' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter, the best replacement to Twitter'
  end

  scenario 'user can add messages to the board' do
    visit '/messages/new'
    fill_in 'user_name', with: 'Nikolaos'
    fill_in 'message', with: 'MA Chitter is a cool app'
    click_button 'Peep'
    expect(current_path).to eq '/messages'
    expect(page).to have_content 'MA Chitter is a cool app'
 end
end
