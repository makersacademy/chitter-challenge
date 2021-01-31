# testing for web infrastructure
feature 'Web infrastructure' do
  scenario 'user visits the webpage' do
    visit('/test')
    expect(page).to have_content 'Test page. Web infrastructure working'
  end
end
