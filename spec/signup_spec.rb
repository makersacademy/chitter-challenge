describe 'signing up' do
  it 'goes to the right page' do
    sign_up
    expect(page.current_path).to eq '/home'
    #  expect(page).to have_content 'HI! Thank you for signing up Reshma123'
    expect(User.all.count).to eq 1
  end
end
