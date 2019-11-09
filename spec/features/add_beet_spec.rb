feature 'Adding Beets' do
  scenario 'adding a beet' do
    visit('/new_beet')
    fill_in(:beet_text, with: "Ohh nana")
    click_button('Post')
    expect(page).to have_content('Ohh nana')
  end
end