feature 'Hello World' do
  scenario 'home has hello world' do
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end