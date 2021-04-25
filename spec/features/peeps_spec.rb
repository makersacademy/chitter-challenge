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

  scenario 'user can view all peeps listed newest to oldest' do
    sign_in

    click_button 'Post a peep'
    expect(current_path).to eq '/peeps/new'

    fill_in :'peep', with: 'this is the first peep'
    click_button 'Peep!'

    click_button 'Post a peep'
    expect(current_path).to eq '/peeps/new'

    fill_in :'peep', with: 'this is the second peep'
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'this is the second peep'
    expect(page).to have_content 'this is the first peep'
  end
end
