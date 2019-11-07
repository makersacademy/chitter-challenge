feature 'Welcome page' do
  scenario 'What is on your mind?' do
    visit ('/')
    click_button "Click here to write a Peep"
    expect(page).to have_content 'What is your message?'
  end
end
