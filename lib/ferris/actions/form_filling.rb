module Ferris
  module Concepts
    module FormFilling
      def fill(data)
        fill_action(data)
      end

      def fill!(data)
        fill_action(data, :do!)
      end

      private

      def fill_action(data, method = :do)
        data.to_hash.each { |k, v| send(k).send(method, v) }
        browser.send_keys :tab
      end
    end
  end
end
