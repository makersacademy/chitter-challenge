feature 'message' do
  scenario 'post a message' do
    visit '/'

    expect(page.status_code).to eq 200

    fill_in 'message', with: 'test message'
    click_button 'Submit'
    expect(page).to have_content 'test message'
  end

end
