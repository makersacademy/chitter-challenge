feature 'testing infrastructure' do
  scenario 'naviagate to test page' do
    visit '/test'
    expect(page).to have_content 'Testing Chitter App'
  end
end
