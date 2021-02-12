class MaterialPolicy < ApplicationPolicy
  def status_learning?
    record.learning?
  end

  def status_complete?
    record.complete?
  end
end