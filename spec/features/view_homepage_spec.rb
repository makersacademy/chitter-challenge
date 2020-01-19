feature 'Viewing homepage' do
  scenario 'the page title is visible' do
    visit '/'
    expect(page).to have_content 'Welcome to my Chitter!'
  end
end
