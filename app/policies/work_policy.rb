class WorkPolicy < ApplicationPolicy
  def create?
    Material.find(record.material_id).learning?
  end

  def edit?
    record.learning?
  end

  def update?
    record.learning?
  end

  # show画面用
  def status_learning?
    record.learning?
  end
end