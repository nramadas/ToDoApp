module ApplicationHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=200"
    image_tag(gravatar_url, gravatar: { s: 200 }, alt: user.name, class: "gravatar")
  end
end
