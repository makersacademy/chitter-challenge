feature 'Testing infrastructure' do
  scenario 'It has Welcome to Chitter on the homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end