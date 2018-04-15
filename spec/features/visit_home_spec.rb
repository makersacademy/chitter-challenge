feature 'test infrastcuture works' do
  scenario 'user visits home page' do
    visit '/'
    expect(page).to have_text('hello world')
  end
end
