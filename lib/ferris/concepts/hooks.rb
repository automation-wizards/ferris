module Ferris
  module Concepts
    module Hooks
      def after_initialize(&blk)
        define_method(:after_initialize) { instance_exec(&blk) }
      end

      def after_visit(&blk)
        define_method(:after_visit) { instance_exec(&blk) }
      end
    end
  end
end
