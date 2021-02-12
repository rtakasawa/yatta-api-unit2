class WorkPolicy < ApplicationPolicy
  def status_learning?
    record.learning?
  end
end