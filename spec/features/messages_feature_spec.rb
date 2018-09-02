feature 'messages' do

  
  scenario 'should have input box for message' do
    visit '/messages'
    expect(page).to have_content 'Enter your message'
  end

  scenario 'message is input and appears on the page' do
    visit '/messages'
    fill_in 'content', with: 'Testing content submission'
    click_on 'submit'
    expect(page).to have_content 'Testing content submission'
  end

  scenario 'message is deleted' do
    visit '/messages'
    fill_in 'content', with: 'Here is a tweet'
    click_on 'submit' 
    click_on 'delete Here is a tweet'
    expect(page).not_to have_content 'Here is a tweet'
  end

  scenario 'user signs up with their name and it appears on the homepage' do
    visit '/'
    fill_in 'name', with: 'Freddie'
    click_on 'submit'
    expect(page).to have_content 'Freddie'
  end
end