feature 'viewing peeps' do
  scenario 'user can click view button' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'peeps')
  end

  scenario 'user can view list of bookmarks' do
    visit '/'
    click_button 'View peeps'
    expect(page).to have_content "Peeps"
  end
end
