feature 'Homepage' do
  scenario 'has the title of the app clone Chitter' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter:'
  end

  scenario 'has peeps which are in the reverse order of which they are posted' do
    login_as_gimli
    fill_in 'peep', with: "Legolas! I'm on two already!"
    click_button 'Peep'
    fill_in 'peep', with: "I'm on seventeen!"
    click_button 'Peep'
    fill_in 'peep', with: "What? I'll have no pointy ear outscoring me!"
    click_button 'Peep'
    expect(page.first('div')).to have_content "What? I'll have no pointy ear outscoring me!" 
  end
end
