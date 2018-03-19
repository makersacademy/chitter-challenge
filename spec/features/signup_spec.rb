feature 'Sign Up Page' do
  scenario 'Has signup button with titles' do
    visit ('/')
    click_button "Sign Up"
    expect(page).to have_content 'Sign Up'
    expect(page).to have_content 'Get in with the Chitter Chat. Get Chitter!'
    expect(page).to have_button 'Sign Up'
  end
end
