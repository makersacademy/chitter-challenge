feature 'user can post a message (peep) to chitter' do
  scenario 'user visits a message board' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'users can add messages to the notice board' do
    visit '/messages/new'
    fill_in 'user_name', with: 'Rupert'
    fill_in 'message', with: 'I do love this tartan scarf #ScarfsForBears'
    click_button 'Peep'
    expect(current_path).to eq '/messages'
    expect(page).to have_content '#ScarfsForBears'
  end
end
