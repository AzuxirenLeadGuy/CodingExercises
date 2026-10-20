# Implements the AbstractFactory pattern for maximum extensibility.
# frozen_string_literal: true

module PersistentChudBatchJob
  class PartitionedMessageQueueDogecoinPacket
    def sign_token(event)
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
