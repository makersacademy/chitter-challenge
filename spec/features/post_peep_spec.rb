feature 'Post a Peep' do
  scenario 'User posts a peep using a form' do
    sign_up
    post_peep
    expect(page).to have_content 'My first peep'
  end
end
