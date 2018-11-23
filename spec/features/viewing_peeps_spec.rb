feature 'Viewing peeps' do
  scenario 'A user can view peeps' do
    visit('/')

    expect(page).to have_content "I am a peep"
    expect(page).to have_content "I am also a peep"
  end
end