feature 'view noms' do

scenario 'user can see list of noms on wall' do
  Nom.create(nom: 'pizza')
  visit '/noms'
  expect(page.status_code).to eq(200)
  within 'ul#noms' do
    expect(page).to have_content('pizza')
  end
end


end
