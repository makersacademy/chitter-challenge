feature 'When accesing home page' do
  scenario 'can see greeting' do
    visit '/'
    expect(page).to have_content "Welcome to chitter"
  end
  scenario 'You can click a button and see Newsfeed' do
    visit '/'
    click_button 'Newsfeed'
    expect(page).to have_content "Newsfeed"
  end
end
