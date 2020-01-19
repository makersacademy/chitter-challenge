feature 'Viewing homepage' do
  scenario 'the page title is visible' do
    sign_up
    expect(page).to have_content 'Welcome to my Chitter!'
  end
end
