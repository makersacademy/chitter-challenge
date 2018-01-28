feature 'Homepage' do
  scenario 'requires my first peep on page' do
    create_peep
    visit '/'
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("my first peep")
    expect(page).to have_content("2018-01-28 14:36:47 +0000")
  end
end
