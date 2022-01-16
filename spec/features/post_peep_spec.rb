feature 'post a peep' do
  scenario 'users are welcomed to the page' do
    visit('/')
    fill_in 'peep', with: "World's smartest peep"
    click_button('Submit')
    expect(page).to have_content("You're on Chitter – Let's Peep!")
  end
  scenario 'features can post and see a new peep' do
    visit('/')
    fill_in 'peep', with: "World's smartest peep"
    click_button('Submit')
    expect(page).to have_content("World's smartest peep")
    expect(page).not_to have_content("Hello World")
  end
  scenario 'features can post and see a new peep' do
    visit('/')
    fill_in 'peep', with: "Another top peep"
    click_button('Submit')
    fill_in 'peep', with: "World's smartest peep"
    click_button('Submit')
    expect(page).to have_content("World's smartest peep")
    expect(page).to have_content("Another top peep")
    expect(page).not_to have_content("Hello World")
  end
  scenario 'the posts are shown in reverse chronologial order' do 
    visit('/')
    fill_in 'peep', with: "World's smartest peep"
    click_button('Submit')
    fill_in 'peep', with: "Another top peep"
    click_button('Submit')
    expect("Another top peep").to appear_before("World's smartest peep")
  end
  scenario 'peeps have a timestamp' do
    visit('/')
    fill_in 'peep', with: "World's smartest peep"
    click_button('Submit')
    time = Timecop.freeze(Time.now)
    p time
    p time.to_s[0..-7]
    expect(page).to include(time.to_s[0..-7])
  end
end
