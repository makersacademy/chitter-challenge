feature 'post message' do

  scenario 'user can post messages to chitter' do
    visit '/'
    click_on 'Post Message'
    fill_in 'message', with: 'Hello world'
    click_on 'Post'
    expect(page).to have_content 'Hello world'
  end

end