feature 'enter a message' do
  scenario 'allow user to submit a message' do
    visit('/')
    fill_in :message, with: "peep"
    expect(page).to have_content "Please add a message"
    expect(page).to have_button('Submit')
  end
end
