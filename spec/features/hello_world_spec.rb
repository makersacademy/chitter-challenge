feature 'hello world' do
  scenario 'on index page' do
    visit('/')
    expect(page).to have_text('Hello world!')
  end
end
