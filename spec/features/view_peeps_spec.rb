feature "viewing peeps" do

  scenario "no login required to view all peeps" do
    sign_in
    post_peep
    sign_out
    visit '/'
    visit '/peeps'
    expect(page).to have_content "peep...."
  end
end

