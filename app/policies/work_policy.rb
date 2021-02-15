class WorkPolicy < ApplicationPolicy
  def new?
    record.learning?
  end

  def create?
    Material.find(record.material_id).learning? && record.learning?
  end

  def edit?
    Material.find(record.material_id).learning? && record.learning?
  end

  def update?
    Material.find(record.material_id).learning? && record.learning?
  end

  # show画面用
  def status_learning?
    Material.find(record.material_id).learning? && record.learning?
  end
end