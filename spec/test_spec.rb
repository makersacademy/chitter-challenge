feature 'page test' do
  scenario 'display message' do
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end
