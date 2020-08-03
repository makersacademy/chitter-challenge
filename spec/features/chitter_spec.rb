feature 'Chitter' do
  scenario 'it has a main page' do
    visit('/')
    expect(page).to have_content('Hello World')
  end

  scenario 'user can post a message' do
    visit('/wall')
    fill_in('username', with: 'Jo')
    fill_in('peep', with: 'hi')
    click_button('Submit')
    expect(page).to have_content('hi')
  end

  scenario 'it shows time' do
    visit('/wall')
    fill_in('username', with: 'Jo')
    fill_in('peep', with: 'hi')
    click_button('Submit')
    t = Time.new.strftime("%Y-%m-%d %H:%M").to_s
    expect(page).to have_content(t)
  end
end
