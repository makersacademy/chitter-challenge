
feature 'Add a beep' do
  before(:each) do
    database_wiper
  end


  scenario 'user can post a beep and see it in the pixelstream' do
    autoregister
    visit('/')
    fill_in 'beep', with: 'Here is the body of my beep'
    click_on('beep-boop')
    expect(page).to have_content('Here is the body of my beep')
    expect(page).to_not have_content('error')
  end

  scenario "non user can't post a beep" do
    visit('/')
    expect(page).to_not have_field('beep')
    expect(page).to_not have_button('beep-boop')
  end

end
