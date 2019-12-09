feature 'Welcome to Chitter' do
  scenario 'user can see a welcoming message' do
    visit '/'
    expect(page).to have_content "Chitter"
  end
  scenario 'user can click button redirecting to /chitter' do
    visit '/'
    click_on 'Start'
    expect(current_path).to eq '/chitter'
  end
end
