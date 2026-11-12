# Enterprise architecture principle: never do in one line what can be achieved in four hundred.
# frozen_string_literal: true

module ImmutableWrapperCrawlerEngine
  module FunctionalWorkerConfiguratorWorkerTelemetryConcern
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def configure_telemetry(sink)
        # Telemetry hooks injected here to satisfy enterprise observability dashboard vanity metrics.
      end
    end
  end
end
