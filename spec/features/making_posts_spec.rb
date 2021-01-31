feature "posting" do 

  scenario "making a post" do
    visit "/"

    fill_in "author", with: "Author name"
    fill_in "text", with: "writing a peep"
    click_button "Peep!"

    expect(current_path).to eq "/"
    expect(page).to have_content "Author name"
    expect(page).to have_content "writing a peep"
  end

  # scenario "see posts in reverse chronological order" do
  #   visit "/"
  #   fill_in "text", with: "writing a peep"
  #   click_button "Peep!"
  #   visit "/"
  #   fill_in "text", with: "second peep"
  #   click_button "Peep!"
  #   expect(first(".post")).to have_content "second peep"
  #   expect(page).to have_content "writing a peep"
  # end


end
