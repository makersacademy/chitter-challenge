module UsersHelper
  def pfp_for(user)
    pfp_id  = Digest::MD5::hexdigest(user.email.downcase)
    pfp_url = "https://www.vippng.com/png/detail/205-2053434_bobross-bob-ross-painting-painter-freetoedit-bob-ross.png"
    image_tag(pfp_url, alt: user.name, class: "pfp")
  end
end
