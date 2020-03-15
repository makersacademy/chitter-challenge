feature 'Testing infrastructure' do
  scenario 'responds to the home page' do
    visit('/')
    expect(page).to have_content('Hello world! Welcome to Chitter!')
  end

  scenario 'has and responds to some input' do
    visit('/')
    fill_in 'chitter', with: 'This is my first chitter!'
    click_button('Peep!')
    expect(page).to have_content('This is my first chitter!')
  end
end