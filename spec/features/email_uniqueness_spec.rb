feature "existing email" do

  scenario "can't use email address" do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
