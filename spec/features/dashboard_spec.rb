feature 'send a message' do
  scenario 'upload a message' do
    visit '/'
    click_on 'Login'
    click_on 'Arr, new tweet'
    fill_in 'message', with: "ahoy mateys, here's me 'ahoy world'!"
    expect(page).to have_content "ahoy mateys"
  end
end