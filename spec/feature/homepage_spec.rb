feature 'homepage' do
  scenario 'displays title' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
