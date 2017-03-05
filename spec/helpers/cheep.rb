module CheepHelpers

  def sign_in_and_cheep
    sign_in
    click_button "Compose Cheep"
    expect(current_path).to eq '/cheep/new'
    fill_in :cheep, with: "Hello, this is a test!"
    click_button "Cheep!"
  end
end
