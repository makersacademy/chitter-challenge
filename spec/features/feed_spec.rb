feature 'news feed' do
  scenario 'shows feed after logging in' do
    visit('/feed')
    expect(page).to have_content('Home')
  end
end