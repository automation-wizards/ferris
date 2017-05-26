module Ferris
  module Concepts
    module Regions
      def regions(name, klass, &blk)
        define_method(name) do
          instance_exec(&blk).map { |block| klass.new(site, block) }
        end
      end

      def region(name, klass, &blk)
        define_method(name) { klass.new(site, &blk) }
      end
    end
  end
end
