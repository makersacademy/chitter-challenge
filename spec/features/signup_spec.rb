feature 'signup' do

  scenario 'I should be welcomed with my email after signing up' do
    visit "/signup"
    fill_in 'name', :with => "Clement"
    fill_in 'username', :with => "Attlee83"
    fill_in 'password', :with => "ilovecricket"
    click_button "join chitter!"
    expect(page).to have_text "Welcome Clement!"
  end

end
