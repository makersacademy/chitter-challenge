feature 'post message' do
  scenario 'message box exists' do
    visit('/')
    expect(page).to have_field("peep")
  end

  scenario 'submit button exists' do
    visit('/')
    expect(page).to have_button('Post Peep!')
  end
end
