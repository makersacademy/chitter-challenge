feature 'Adding Beets' do
  scenario 'adding a beet' do
    visit('/new_beet')
    fill_in(:beet_text, with: "SJWs make me sick!")
    click_button('Post')
    expect(page).to have_content('SJWs make me sick!')
  end
end