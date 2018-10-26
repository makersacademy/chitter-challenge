feature "signing out" do
  before do
    visit '/'
    sign_up
  end

  scenario 'can see Sign Out button' do
    expect(page).to have_selector(:button, "Sign Out")
  end
end
