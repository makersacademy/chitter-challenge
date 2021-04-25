feature 'peeps' do
  scenario 'user can post a peep' do
    sign_in

    click_button 'Post a peep'
    expect(current_path).to eq '/peeps/new'

    fill_in :'peep', with: 'Hi, I am a new student at makers'
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hi, I am a new student at makers'
  end
end
