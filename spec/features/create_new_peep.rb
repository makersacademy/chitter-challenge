feature 'peeping' do
  scenario 'the user can post a message to the page' do
    visit '/'
    fill_in 'textbox', with: 'This is a message!'
    click_button 'Peep'
    expect(page).to have_content 'This is a message!'
  end
end
