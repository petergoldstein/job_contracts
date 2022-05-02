# frozen_string_literal: true

class DurationExampleJob < ApplicationJob
  include JobContracts::Contractable

  add_contract JobContracts::DurationContract.new(duration: 1.second)

  def perform
    sleep 2
  end

  def contract_breached!(contract)
    # log and notify apm/monitoring service
    Rails.logger.info "Contract breached! #{contract.inspect}"
  end
end
