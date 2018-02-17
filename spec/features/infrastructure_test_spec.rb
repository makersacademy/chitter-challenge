feature 'testing infrastructure' do
  scenario 'run app and display welcome content' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
