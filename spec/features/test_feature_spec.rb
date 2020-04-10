xfeature 'hello world' do
  scenario 'index page prints hello world' do
    visit '/'
    expect(page).to have_content 'Hello world'
  end
end