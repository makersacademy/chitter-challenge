feature 'peeps' do
  scenario 'form to enter peeps' do
    visit '/peeps'
    expect(page).to have_content "Peep"
    click_on "Post"
  end
end

feature 'post' do
  scenario 'post a peep' do
    visit '/peeps'
    fill_in "peep", with: "feature test peep"
    click_on "Post"
    expect(page).to have_content "feature test peep"
  end
end

feature 'date and time' do
  scenario 'it stores date and time for each post' do
    visit '/peeps'
    fill_in "peep", with: "another feature test peep"
    click_on "Post"
    expect(page).to have_content "another feature test peep [ posted on 2019-"
  end
end

feature 'username' do
  scenario 'peeps say username' do
    visit '/'
    fill_in "username", with: "Debora"
    fill_in "email", with: "debora@email.com"
    fill_in "password", with: "secretpassword"
    find_button("Submit").click
    fill_in "peep", with: "This is my tweet"
    click_on "Post"
    expect(page).to have_content "Debora"
    expect(page).to have_content "This is my tweet"
  end
end
