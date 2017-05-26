require_relative '../../data/element_data'
require_relative 'regions/elements_header_region'
require_relative 'pages/elements_page'

class ComplianceSite < Ferris::Site

  page(:elements_page, ElementsPage)
  region(:elements_header, ElementsHeaderRegion) { browser.header }
  element(:my_element) { browser.body }

end


