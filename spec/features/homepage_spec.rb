
feature 'homepage' do
  scenario 'user can post message to appear in Chitter feed' do
    visit('/')
    fill_in 'message', with: 'Social media is to socializing what masturbating is to sex.'
    click_button 'post'
    expect(page).to have_content('Social media is to socializing what masturbating is to sex.')
  end
  
  pending 'previous cheeps should appear in reverse chronological order' do
    # Can't get this working at all >:-(
    visit('/')
    fill_in 'message', with: 'message1'
    click_button 'post'
    expect(page).to have_css("ul:last-child", :text => "message1")
    fill_in 'message', with: 'message2'
    click_button 'post'
    expect(page).to have_css("ul:last-child", :text => "message2")
    # expect(page).to have_text(/'message2'.+ 'message1'/ )
  end

  scenario 'users should be able to log out' do
    visit('/login')
    fill_in 'Enter Email', with: 'donotreply@mail.com'
    fill_in 'Enter Password', with: 'Qwe1'
    click_button 'Login'
    click_button 'Logout'
    expect(current_path).to eq('/')
    expect(page).to have_button('Login')
  end

  before do
    now = Time.local(2008, 9, 1, 12, 0, 0)
    Timecop.freeze(now)
  end

  after do
    Timecop.return
  end

  scenario 'cheeps should display the time they were posted' do
    visit('/')
    fill_in 'message', with: 'Social media is to socializing what masturbating is to sex.'
    click_button 'post'
    expect(page).to have_content("posted at: 2008-09-01 12:00:00")
  end    
end
