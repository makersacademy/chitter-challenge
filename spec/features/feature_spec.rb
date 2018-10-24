feature 'testing infrastructure' do
  scenario 'should have a button to open chitter app' do
    visit '/'
    expect(page).to have_button 'Open Chitter App'
  end
  scenario 'should link to the chitter app' do
    visit '/'
    click_button 'Open Chitter App'
    expect(page).to have_content 'Chitter App!'
  end
end
