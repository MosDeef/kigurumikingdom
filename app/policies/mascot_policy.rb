class MascotPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.order(:name)
    end

    def show?
      true
    end

    def new?
      create?
    end

    def create?
      true
    end
  end
end
