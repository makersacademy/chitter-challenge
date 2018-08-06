feature 'Entering a message' do
  scenario 'Returns the message' do
    sign_in_and_enter
    fill_in :peep, with: 'Hello there'
    click_button 'Peep it'
    expect(page).to have_content 'Daniel - Hello there'
  end
end
