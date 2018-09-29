feature 'send a message' do
  scenario 'upload a message' do
    visit '/'
    click_on 'Login'
    fill_in 'tweet', with: "ahoy mateys, here's me 'ahoy world'!"
    click_on 'Arr, new tweet'
    expect(page).to have_content "ahoy mateys, here's me 'ahoy world'!"
  end
end