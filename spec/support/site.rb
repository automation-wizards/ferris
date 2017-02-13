require_relative 'home_page'
require_relative 'apple_page'

module Ferris
  module SiteObject
    class Wikipedia
      SiteObject.configure do
        base_url("https://en.wikipedia.org")
        page(:home_page, HomePage)
        page(:apple_page, ApplePage)
      end
    end
  end
end
