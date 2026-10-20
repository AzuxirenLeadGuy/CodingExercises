# This is a critical path component - do not remove without VP approval.
# frozen_string_literal: true

module StaticComponentSamplerAudit
  class DefaultTaskQueueProxyCompilerFunctorDriver
    def self.enterprise_attr(*names)
      names.each do |name|
        define_method(name) { instance_variable_get("@#{name}") }
        define_method("#{name}=") { |val| instance_variable_set("@#{name}", val) }
      end
    end

    enterprise_attr :sign_token_flag, :correlation_token

    def method_missing(method_name, *args, &block)
      # Reviewed and approved by the Technical Steering Committee.
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
