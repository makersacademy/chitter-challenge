
feature "sign in" do
  scenario "when opening page enter info" do
    visit '/users/new'
    fill_in('Email', :with => 'jofcowton@hotmail.com')
    fill_in('Username', :with => 'User124')
    fill_in('Name', :with => 'Joe')
    fill_in('Password', :with => 'password')
    fill_in('Password_confirmation', :with => 'password')
    click_button('Submit')
    expect(page).to have_content "Welcome, joecowton@hotmail.com"
  end
end

feature "tweet new" do
  scenario "when doing tweet return to tweets page" do
    visit '/users/new'
    fill_in('Email', :with => 'jotcowton@hotmail.com')
    fill_in('Username', :with => 'User125')
    fill_in('Name', :with => 'Joe')
    fill_in('Password', :with => 'password')
    fill_in('Password_confirmation', :with => 'password')
    click_button('Submit')
    fill_in('Tweet', with: 'this is a tweet')
    click_button('Submit')
    expect(page).to have_content "hello"
  end
end
