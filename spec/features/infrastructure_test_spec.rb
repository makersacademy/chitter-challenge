feature 'Infrastructure Test' do
  scenario 'page has correct content' do
    visit '/'
    expect(page).to have_content "Testing, 1, 2, 3...is this mic on?"
  end
end
