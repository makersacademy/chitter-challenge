feature 'test' do
  scenario 'test sinatra' do
    visit('/')
    expect(page).to have_content 'Hello world'
  end
end