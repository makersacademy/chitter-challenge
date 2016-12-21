feature "Entry Page" do

  scenario "From the homepage I can sign up" do
    visit '/'
    click_button "Sign Up"

    expect(current_path).to eq '/users/new'
  end

  scenario "From the homepage I can sign in" do
    visit '/'
    click_button "Sign In"

    expect(current_path).to eq '/session/new'
  end
end
