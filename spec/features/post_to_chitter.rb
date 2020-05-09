feature 'posting to chitter' do
  scenario 'user posts to chitter' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    fill_in(:peep, with: "I'm making a Chitter clone!")
    click_on('Submit')
  end
end
