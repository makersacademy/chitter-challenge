feature 'testing redirect' do
  scenario 'it must redirect from / to /chitter_feed' do
    visit '/'
    expect(page).to have_content("We have redirected to the Feed")
  end
end
