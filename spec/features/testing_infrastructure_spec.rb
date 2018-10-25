feature 'tests' do
  scenario 'testing infrastructure works' do
    visit '/'
    expect(page).to have_content 'Hello world'
  end
end
