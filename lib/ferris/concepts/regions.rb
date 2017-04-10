module Ferris
  module Concepts
    module Regions
      def regions(name, klass, &blk)
        define_method(name) do
          instance_exec(&blk).map { |root| klass.new(root) }
        end
      end

      def region(name, klass, &blk)
        define_method(name) { klass.new(&blk) }
      end
    end
  end
end