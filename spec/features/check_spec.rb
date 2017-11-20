feature 'See all peeps' do
  before(:each) do
    sign_up
    fill_in('peep', with: 'Hello world!')
    click_button('Post!')
  end

  scenario 'see a list of peeps' do
    expect(page).to have_content 'Hello world!'
  end
end
