module Rgn
  class Header < Ferris::Region
    el(:title) { r.h1 }
    el(:tagline) { r.p }
  end
end
