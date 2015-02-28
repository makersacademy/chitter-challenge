feature "Existing user can log into Chitter" do


# before(:each) do
#     User.create(:email => "mrTex@test.com",
#                 :password => 'TedTex',
#                 :password_confirmation => 'TedTex')
#     end

  scenario 'with correct credentials' do
    sign_in("mrTex@test.com" "TedTex")
    expect(page).to have_content('Welcome mrTex@test.com')
  end

  scenario 'with the wrong credentials' do
    sign_in("mrTex@test.com" "wrongOne")
    expect(page).not_to have_content('Welcome mrTex@test.com')
  end

end