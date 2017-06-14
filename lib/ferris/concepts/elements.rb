module Ferris
  module Concepts
    module Elements
      def element(name, &block)
        define_method(name) { instance_exec(&block) }
      end
      alias el element
    end
  end
end
