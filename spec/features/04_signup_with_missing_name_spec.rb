feature "signing up without a name" do
  scenario "maker cannot sign up without a name" do
    expect{ sign_up_without_name }.to_not change(Maker, :count)
    expect(page).to have_content 'Name required.'
  end
end
