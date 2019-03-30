# home page

feature 'Viewing home page' do
  scenario 'Introductory title' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_content 'Peeps'
  end
end

feature 'Viewing home page' do
  scenario 'Shows peepdeck' do
    visit('/')
    expect(page).to have_content 'My first peep!'
  end
end
