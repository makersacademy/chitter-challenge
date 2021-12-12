feature 'posting chitt' do

  scenario 'Can post a chitt' do
    visit '/chitter/post'
    fill_in('chitt', with: "Im making a test Chitt!")
    click_button('Submit')
    click_button('View Chitts')
    expect(page).to have_content 'Noone - Im making a test Chitt!'
  end

end
