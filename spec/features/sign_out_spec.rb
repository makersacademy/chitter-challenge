feature "sign_out" do

  scenario "allows users to sign out" do
    log_in
    click_on("S i g n  o u t")
    expect(current_path).to eq "/"
  end

end
