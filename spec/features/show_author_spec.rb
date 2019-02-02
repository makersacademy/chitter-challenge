
feature 'Show beep Author' do
  before(:each) do
    database_wiper
    autoregister
  end

  scenario 'usr : testyboy posts a tweet, displays his name' do
    fill_in 'beep', with: 'Here is the body of my beep'
    click_on('beep-boop')
    expect(page).to have_content("✧ʕ̢̣·͡˔·ོɁ̡̣✧ :testyboy")
  end
end
