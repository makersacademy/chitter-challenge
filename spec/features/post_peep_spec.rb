feature 'User posts a peep' do
  before do
    sign_up
  end

  scenario 'can post a peep' do
    post_peep
    expect(page).to have_content('Hello World!')
  end
end
