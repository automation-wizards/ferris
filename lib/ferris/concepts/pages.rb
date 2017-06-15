module Ferris
  module Concepts
    module Pages
      def page(name, klass)
        define_method(name) do
          site.after_visit
          klass.new(site: site)
        end
      end
      alias pg page
    end
  end
end
