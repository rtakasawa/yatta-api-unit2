class WorkPolicy < ApplicationPolicy
  def new?
    record.learning?
  end

  def create?
    record.material.learning? && record.learning?
  end

  def edit?
    record.material.learning? && record.learning?
  end

  def update?
    record.material.learning? && record.learning?
  end

  # show画面用
  def status_learning?
    record.material.learning? && record.learning?
  end
end