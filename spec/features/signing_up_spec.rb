feature 'signing up' do
  scenario 'being greeted by username' do
    sign_up_and_get_peeping

    expect(page).to have_content 'Hello @test_name!'
    expect(current_path).to eq '/peeps'
  end
end
