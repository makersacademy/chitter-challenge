feature 'post message' do
  scenario 'message box exists' do
    visit('/')
    expect(page).to have_field("peep")
  end
end
