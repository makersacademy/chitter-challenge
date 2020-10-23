feature 'app outputs to local host' do
  scenario 'hello world visibile on home page' do
    visit('/')
    expect(page).to have_content('hello world')
  end
end
