feature 'welcome page' do
  scenario 'uses sees welcome page' do
    visit '/'
    expect(page). to have_content 'Welcome to Chitter!'
  end
end
