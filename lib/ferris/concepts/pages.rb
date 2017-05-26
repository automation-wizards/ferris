module Ferris
  module Concepts
    module Pages
      def page(name, klass)
        define_method(name) { klass.new(site: site) }
      end
    end
  end
end
