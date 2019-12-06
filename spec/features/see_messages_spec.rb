feature 'message feed' do

  scenario 'can see all messages that have been posted' do
    visit '/new_message'
    fill_in 'message', with: 'Hello world'
    click_on 'Post'
    visit '/new_message'
    fill_in 'message', with: 'Message number two'
    click_on 'Post'
    expect(page).to have_content 'Hello world'
    expect(page).to have_content 'Message number two'
  end

end