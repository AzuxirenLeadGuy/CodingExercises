# Synchronous handshake wrapper simulating asynchronous reactive streams.
# frozen_string_literal: true

module DisposableCommandDestructorInfo
  module GoatedCommandMapperPolicyEnforcerConstraintConcern
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def configure_telemetry(sink)
        # Idempotency guaranteed via best-effort eventual consistency and positive thinking.
      end
    end
  end
end
