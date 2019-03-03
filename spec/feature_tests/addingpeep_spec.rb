feature 'adds a peep' do
  scenario 'can enter text which becomes a peep' do
    visit '/yourpeep'
    expect(page).to have_content "Post your peep ʕ•ᴥ•ʔ"
  end
end

feature 'added to homepage' do
 scenario 'peep appears on homepage' do
   visit '/yourpeep'
   fill_in('peep', with: 'Bobs trip') 
   click_button 'Submit'
   expect(page).to have_content 'Bobs trip'
 end
end
