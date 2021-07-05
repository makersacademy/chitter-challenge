feature "post" do
  scenario "can be made by a user" do
    visit('/')
    page.fill_in 'peep', with: 'First chitter!'
  end
end