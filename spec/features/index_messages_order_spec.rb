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

    first_child = find("ul li:first-child")
    last_child = find("ul li:last-child")
    expect(first_child).to have_content "this is 3rd message"
    expect(last_child).to have_content "this is first message"
    # reverse chronological order test
  end

end
