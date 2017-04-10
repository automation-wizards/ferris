module Ferris
  module Concepts
    module PageAttributes

      def base_url(&blk)
        define_method(:base_url) { instance_exec(&blk) }
      end

      def partial_url(&blk)
        define_method(:partial_url) { instance_exec(&blk) }
      end

      def title(&blk)
        define_method(:title) { instance_exec(&blk) }
      end
    end
  end
end
