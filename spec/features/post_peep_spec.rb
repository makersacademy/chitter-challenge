feature 'Posting Peeps' do

  before(:each) do
    sign_up_first
  end

  scenario 'I can post a single peep' do
  post_a_peep(test_peep_one)
  expect(page).to have_content test_peep_one
  end

end
