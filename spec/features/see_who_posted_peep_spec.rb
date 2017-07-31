feature 'identifies peeper' do
  let(:content) { 'comment' }
  before do
    sign_up
    log_in('Dave', '12345')
  end
  scenario "shows user's name and username" do
    new_peep(content)
    expect(page).to have_content("Dave Davis (@Dave)")
  end
end
