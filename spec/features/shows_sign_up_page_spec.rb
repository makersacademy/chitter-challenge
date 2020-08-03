feature 'login page' do
  scenario 'displays login page' do
    visit '/'
    expect(page).to have_field("Username")
    expect(page).to have_field("Name")
    expect(page).to have_field("E-Mail")
    expect(page).to have_field("Password")
  end
end
