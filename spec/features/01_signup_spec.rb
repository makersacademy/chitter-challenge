feature "signing up" do

  scenario "opening page redirects to signup page" do
    visit '/'
    expect(page.current_path).to eq '/signup'
  end

  scenario "after signing up, a maker can post messages" do
  valid_sign_up
  expect(page).to have_content 'Welcome, David Wright'
  expect(Maker.count).to eq 1
  end
end
