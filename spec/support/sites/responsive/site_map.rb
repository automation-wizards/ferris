require_relative 'regions/static_hero_region'
require_relative 'pages/static_page'

class ResponsiveSite < Ferris::Site
  page(:static_page,   StaticPage)
end
