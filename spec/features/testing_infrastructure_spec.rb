#can delete this test when start building - just to test file set up
feature 'testing infrastructure' do
  scenario 'shows a webpage' do
    visit '/'
    expect(page).to have_content "Hello World"
  end
end
