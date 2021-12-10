feature 'creating messages' do
  scenario 'can add a message and see it on the page' do
    visit('/messages')
    fill_in('text', with: 'Hello World!')
    click_button('Submit')
    expect(page).to have_content 'Hello World!'
  end
end