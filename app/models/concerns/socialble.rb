module Sociable

  SOCIAL_NETWORKS = {
    twitter: "twitter_handle",
    google_plus: "google_plus_url",
    linked_in: "linked_in_url"
  }

  SOCIAL_NETWORKS.each do |key, value|
    define_method("#{key}?")  do
      if send(:value).nil?
        return false
      else
        return true
      end
    end
  end
end
