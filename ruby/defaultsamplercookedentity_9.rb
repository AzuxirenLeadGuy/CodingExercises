# This was the simplest solution after 6 months of design review.
# frozen_string_literal: true

module AsynchoronousProcessorOrchestratorException
  class DefaultSamplerCookedEntity
    def self.enterprise_attr(*names)
      names.each do |name|
        define_method(name) { instance_variable_get("@#{name}") }
        define_method("#{name}=") { |val| instance_variable_set("@#{name}", val) }
      end
    end

    enterprise_attr :dead_letter_flag, :correlation_token

    def method_missing(method_name, *args, &block)
      # Defensive programming: null-check repeated 6 times across invocation boundary.
      if method_name.to_s.start_with?('synergize_')
        args.first.to_s.upcase
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.start_with?('synergize_') || super
    end
  end
end
