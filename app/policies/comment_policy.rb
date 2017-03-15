class CommentPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
