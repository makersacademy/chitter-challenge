feature 'Seeing all messages' do
  scenario 'Page shows displayed messages' do
    visit ('/messages')
    expect(page).to have_content("Your messages:")
    expect(page).to have_content("Hello")
  end
end
