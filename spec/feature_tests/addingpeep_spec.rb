feature 'adds a peep' do
  scenario 'can enter text which becomes a peep' do
    visit '/yourpeep'
    expect(page).to have_content "Post your peep ʕ•ᴥ•ʔ"

  end
end
