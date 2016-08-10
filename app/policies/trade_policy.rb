class TradePolicy < ApplicationPolicy
  def create?
    user.admin? || user.vip?
  end

  def update?
    user.admin? || user.vip?
  end

  def destroy?
    user.admin? || user.vip?
  end
end
