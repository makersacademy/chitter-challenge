feature 'A user can post a peep' do
  scenario 'User sees their peep after posting it' do
    visit('/peeps')
    click_button('Post a Peep')
    expect(current_path).to eq('/post')
    fill_in('peep', with: 'This is my first peep')
    click_button('Submit Peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is my first peep'
  end
end
