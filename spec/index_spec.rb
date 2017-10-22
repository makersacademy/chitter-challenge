feature 'Homepage' do
  before { visit '/'}
  scenario 'I want to have a homepage welcome users' do
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario 'I want a sign up link on the homepage' do
    expect(page).to have_link 'Sign up'
  end
end
