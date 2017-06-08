module Ferris
  module Concepts
    module Pages
      def page(name, klass)
        define_method(name) { klass.new(site: self) }
      end
      alias pg page
    end
  end
end
