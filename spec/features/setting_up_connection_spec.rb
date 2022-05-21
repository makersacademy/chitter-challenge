feature 'Connection works' do
  scenario 'When user goes on homepage, the page displays hello' do
    visit '/'
    expect(page).to have_content 'hello'
  end
end
