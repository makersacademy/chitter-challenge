feature 'Posting messages' do
  scenario 'message can be made and displayed' do
    visit '/'
    click_button 'Messaging'
    fill_in "message", with: "some random message"
    click_button "Submit"
    expect(page).to have_content "some random message"
  end
end
