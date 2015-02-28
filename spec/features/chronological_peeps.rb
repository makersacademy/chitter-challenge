feature "Display peeps" do

  scenario "Peeps show in chronological order" do
    sign_in
    peep1 = enter_peep
    peep2 = enter_peep
    expect(first_article.entry_time)to eq peep2.entry_time
  end



end