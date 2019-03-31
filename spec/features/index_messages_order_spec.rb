feature 'messages index with reverse order' do 
  scenario 'it displays messages in reverse order, with time posted' do
    signup
    visit '/messages/new' 
    fill_in('content', with: 'this is first message')
    click_button('Submit')
    visit '/messages/new' 
    fill_in('content', with: 'this is 2nd message')
    click_button('Submit')
    visit '/messages/new' 
    fill_in('content', with: 'this is 3rd message')
    click_button('Submit')

    # expect(page).to have_content 'this is 3rd message'+'this is 2nd message'+'this is first message'
    # reverse chronological order test
  end

end
