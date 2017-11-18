
feature "sign in" do
  scenario "when opening page enter info" do
    visit '/users/new'
    fill_in('Email', :with => 'joecowton@hotmail.com')
    fill_in('Password', :with => 'password')
    fill_in('Password_confirmation', :with => 'password')
    click_button('Submit')
    expect(page).to have_content "Welcome, joecowton@hotmail.com"
  end
end

feature "tweet new" do
  scenario "when doing tweet return to tweets page" do
    visit '/users/new'
    fill_in('Email', :with => 'joecowton@hotmail.com')
    fill_in('Password', :with => 'password')
    fill_in('Password_confirmation', :with => 'password')
    click_button('Submit')
    fill_in('Tweet', with: 'hello')
    click_button('Submit')
    expect(page).to have_content "hello"
  end
end
