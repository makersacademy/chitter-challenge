feature 'can post a peep to Chitter' do
  scenario 'user writes a peep and posts it to Chitter' do
    visit('/chitter/new')
    fill_in("content", with: "Love taking my dog out for a walk, we really bond")
    click_button("Peep!")

    expect(page).to have_content("Love taking my dog out for a walk, we really bond")
  end
end
