feature 'post' do
  scenario 'should post a peep' do
    visit '/peeps'
    fill_in('name', with: 'Anouska Hopkins')
    fill_in('username', with: 'ahopkins')
    fill_in('post', with: 'My first post')
    click_button 'submit'
    expect(page).to have_content 'My first post'
    expect(page).to have_content 'Anouska Hopkins'
    expect(page).to have_content 'ahopkins'
  end
end
