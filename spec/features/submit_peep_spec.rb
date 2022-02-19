feature 'submit peep' do
  scenario 'it submits a peep' do
    visit '/'
    fill_in('text', with: 'Hello mate')
    click_button('Submit')
    expect(page).to have_content 'Hello mate'
  end
end
