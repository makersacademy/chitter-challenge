feature 'post peep' do
  scenario 'able to post a peep' do
    visit('/')
    expect(page).to have_content("Welcome to Chitter!")
  end
end
