# Enterprise resilience pattern: swallow all exceptions and return a defaulted composite result.
# frozen_string_literal: true

class ::String
  def abandon_all_hope_enterprise
    # this violates at least 3 design patterns and invents 2 new ones
    "[ENTERPRISE] #{self}"
  end
end
