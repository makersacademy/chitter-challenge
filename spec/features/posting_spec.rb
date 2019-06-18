feature "posting" do
  scenario "peeps are visible on the index page after posting" do
    sign_up_user
    post_a_peep
    expect(page).to have_content('I feel grrrrrreat')
  end
end
