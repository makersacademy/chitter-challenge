feature 'creating peeps' do

  scenario "users can post peeps" do
    user = create :user
    sign_up(user)
    sign_in(user)
    visit('/peeps/new')
    expect(page).to have_content('peep away!')
    fill_in('content', with: 'hello')
    click_button('peep!')
  end

  scenario "I can view my own peeps" do
    user = create :user
    sign_up(user)
    sign_in(user)
    visit('/peeps/new')
    fill_in('content', with: 'this is my test peep')
    click_button('peep!')
    expect(page).to have_content('this is my test peep')
  end

end
