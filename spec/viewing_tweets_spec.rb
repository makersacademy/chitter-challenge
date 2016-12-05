feature 'vieiwing tweets' do
  scenario 'should be able to view tweets' do
    sign_up
    Tweet.create(message: 'thomas edison: i have an idea [a fucked up rough draft of the lightbulb appears above his head]', :user_id => '1')
    visit '/twitter'
    save_and_open_page
    expect(page.status_code).to eq 200
    within 'ul#tweets' do
      expect(page).to have_content('thomas edison')
    end
  end
end
