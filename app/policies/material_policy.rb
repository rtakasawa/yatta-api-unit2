class MaterialPolicy < ApplicationPolicy
  # WorksControllerにて使用
  def new?
    record.learning?
  end

  def edit?
    record.learning?
  end

  def update?
    record.learning?
  end

  def change_learning?
    record.complete?
  end

  def change_complete?
    record.learning?
  end
end