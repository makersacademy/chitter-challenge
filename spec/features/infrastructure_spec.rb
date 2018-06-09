feature 'user can access webpage' do
  scenario 'user can view homepage' do
    visit '/'

    expect(page).to have_content 'Welcome to Chitter!'
  end
end
