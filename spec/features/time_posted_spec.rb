feature 'messages index with reverse order' do 
  scenario 'it displays messages in reverse order, with time posted' do
    Timecop.freeze(2019, 3, 31, 0, 0, 0)
    signup
    visit '/messages/new' 
    fill_in('content', with: 'this is first message')
    click_button('Submit')
    expect(page).to have_content('2019-03-31 00:00:00')

  end
end
