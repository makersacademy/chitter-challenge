RSpec.feature "Post Peep" do

  let(:content) { "This is the first ever peep posted"}
  scenario "after sign in" do
    sign_up
    visit '/peeps/new'
    fill_in 'post', with: content
    click_button 'submit'
    expect(page).to have_content content
  end
end
