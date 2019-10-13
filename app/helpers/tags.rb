def read_tags
  @tags[:unread].each do |tag|
    tag.read!
  end
end
