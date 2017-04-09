feature 'view meows' do
  scenario 'see meows on homepage' do
    Meow.create(message: 'Hey kitty girl!')
    visit '/meows'
    expect(page.status_code).to eq 200

    within 'ul#meows' do
     expect(page).to have_content('Hey kitty girl!')
    end
  end
end
