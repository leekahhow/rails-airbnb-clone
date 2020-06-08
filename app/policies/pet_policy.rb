class PetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
