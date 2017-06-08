require_relative 'data/element_data'
require_relative 'regions/header'
require_relative 'regions/article'
require_relative 'pages/elements'

class Website < Ferris::Site
  after_initialize { }
  after_visit      { }
  
  pg(:elements_pg, Pg::El)

  rgn(:header,    Rgn::Header)  { b.header }
  rgn(:articles,  Rgn::Article) { b.articles }

end


