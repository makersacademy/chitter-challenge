feature 'Add peeps' do
  before do
    add_test_users_and_login
    visit '/peep/new'
  end

  scenario 'Page loads and form visible' do
    expect(page).to have_content 'Add peep'
    expect(page).to have_field 'post'
    expect(page).to have_button 'Post your peep'
  end

  scenario 'Can add a peep' do
    fill_in 'post', with: 'A random peep'
    click_button 'Post your peep'
    expect(page).to have_content 'A random peep'
  end
end
