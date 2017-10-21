feature 'Homepage' do
  scenario 'I want to have a homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
    expect(page).to have_link 'Sign up'
  end
end
