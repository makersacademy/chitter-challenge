feature 'Posting messages' do

  scenario 'users can post messages' do
    visit '/chat'
    fill_in :message, with: 'Hello World!'
    click_on 'PeepIt'
    expect(page).to have_content 'Hello World!'
  end

end
