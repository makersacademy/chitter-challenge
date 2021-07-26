feature 'Can connect to home page' do
  scenario 'Connection works' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end

feature 'Peeps are saved to database and displayed' do
  scenario 'Homepage has a peep box which submits peeps' do
    visit('/')
    fill_in('peep', with: "Hi, I'm on Chitter!")
    click_button('Post peep')
    expect(page).to have_content("Hi, I'm on Chitter!")
  end
end