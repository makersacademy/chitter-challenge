feature 'Check that a homepage can be loaded' do
  scenario 'greeted by hello world' do
    visit '/'
    expect(page).to have_content('hello world')
  end
end
