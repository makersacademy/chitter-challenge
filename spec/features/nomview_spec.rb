feature 'view noms' do

scenario 'user can see list of noms on wall' do
  Nom.create(nom: 'pizza')
  visit '/noms'
  expect(page.status_code).to eq(200)
  within 'ul#noms' do
    expect(page).to have_content('pizza')
  end
end

scenario 'noms include time stamp' do
  Nom.create(nom: 'pizza', posted: 'today')
  visit '/noms'
  expect(page.status_code).to eq(200)
  within 'ul#noms' do
    expect(page).to have_content('today')
  end
end


xscenario 'noms include user\'s name' do
  sign_up
  Nom.create(nom: 'pizza')
  visit '/noms'
  expect(page.status_code).to eq(200)
  within 'ul#noms' do
    expect(page).to have_content('pizza')
    expect(page).to have_content('newbie')
  end
end

scenario 'user can add post new noms' do
  visit('/noms')
  click_button "New nom"
  expect(page).to have_content('New Nom')
end

end
