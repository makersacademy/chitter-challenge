feature 'Testing infrastructure' do

  scenario 'Can run app' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
