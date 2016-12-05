RSpec.feature "Post Peep" do

  let(:content) { "This is the first ever peep posted"}
  scenario "after sign in" do
    sign_up
    make_peep content
    expect(page).to have_content content
  end
end
