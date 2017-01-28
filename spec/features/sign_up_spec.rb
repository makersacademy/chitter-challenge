feature 'FEATURE: sign up' do

  scenario 'Can click to sign up from home page' do
    visit('/')
    click_button('sign_up')
    expect(page.current_path).to eq "/users/new"
  end

end
