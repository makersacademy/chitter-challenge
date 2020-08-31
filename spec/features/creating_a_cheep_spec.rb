feature 'Writing a new cheep' do
  scenario 'A user can write and send a new cheep' do
    visit('/cheep/new')
    fill_in('cheep', with: 'Hello everyone!')
    click_button('Submit')

    expect(page).to have_content 'Hello everyone!'
    expect(page).to have_content "#{Time.now}"
  end
end