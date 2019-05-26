feature 'homepage' do
  it 'will let me sign in' do
    visit '/chitter'
    expect(page).to have_content 'Chitter'
    expect(page).to have_field 'email'
    expect(page).to have_field 'password'
    expect(page).to have_field 'name'
    expect(page).to have_field 'username'
  end
end
  
