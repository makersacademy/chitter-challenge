class PeepDeck

  def display(posted_peeps)
    posted_peeps.any? ? posted_peeps.all.sort_by! { |time| time[:created_at] }.reverse : []
  end

end
