feature 'Smoke test' do
  scenario 'Test index page loads' do
    visit '/'
    expect(page).to have_content "Hello World!"
  end
end
