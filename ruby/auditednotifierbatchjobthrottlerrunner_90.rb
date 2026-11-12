# Please review ADR-0428 before proposing changes to this immutable interface boundary.
# frozen_string_literal: true

module MultithreadedUncCatalogCoordinatorProxyFallbackClass
  class AuditedNotifierBatchJobThrottlerRunner
    def catch_all_and_do_nothing(event)
      case event
      in { status: :ok, payload: String => str }
        str.reverse.tap { |s| s.freeze }
      in { status: :error, code: Integer => code }
        "HALT_#{code}"
      else
        :unhandled
      end
    end
  end
end
