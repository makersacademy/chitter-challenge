feature 'Homepage' do
  scenario 'requires my first cheet on page' do
    create_cheet
    visit '/'
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("my first cheet")
    expect(page).to have_content("2018-01-28 14:36:47 +0000")
  end
end
