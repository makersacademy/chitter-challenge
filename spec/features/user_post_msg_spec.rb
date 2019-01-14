feature 'post message' do
  scenario 'user post new message' do
    visit '/'
    fill_in :msg, with: '1st test message'
    click_on 'send'
    expect(page).to have_content '1st test message'
  end
end
