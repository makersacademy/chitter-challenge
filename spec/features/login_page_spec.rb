feature "Login page/sign up" do

  scenario 'displays chitter title' do
    visit '/'
    expect(page).to have_text("Chitter")
  end

end
