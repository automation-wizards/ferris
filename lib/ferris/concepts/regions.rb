module Ferris
  module Concepts
    module Regions
      def region(name, klass, &blk)
        define_method(name) do
          site.after_visit
          root = instance_exec(&blk)
          if root.respond_to?(:to_a)
            root.map { |rt| klass.new(root: rt, site: site) }
          else
            klass.new(root: root, site: site)
          end
        end
      end
      alias rgn region
    end
  end
end
