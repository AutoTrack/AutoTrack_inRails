class Ability
  # before_action :authenticate_business_user_with_token!
  # before_action :authenticate_employee_user_with_token!
  include CanCan::Ability

  def initialize user, options = {}

    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :create, :read, :update, :to => :cru
    alias_action :read, :update, :destroy, :to => :rud
    alias_action :read, :update, :to => :ru

    if !user
      can :read, [ EmployeeUser ]
    end

    if user
      level1_rules if user.roles.include? :level1
      level2_rules if user.roles.include? :level2
      level3_rules if user.roles.include? :level3
      level4_rules if user.roles.include? :level4
      default_rules
    end
  end
  # Provides user crud access to everything.
  def level1_rules
    can :manage, :all
  end

  # Provides user the additonal ability to adjust Inventory, including cost. Cannot
  # create or delete repair orders and invoices.
  def level2_rules
    can :manage, [ InventoryItem, RepairItem, Vehicle, Client ]
    can :ru, [ RepairOrder, Invoice ]

  end

  # Provides user the ability to do everything accept handle inventory.
  def level3_rules

    can :manage, [ RepairOrder, RepairItem, Vehicle, Client ]
    can :cru, [ Invoice ]
  end

  # Provides user  with ability to only update a repair order with a repair item.
  def level4_rules
    can :read, [ Vehicle, InventoryItem ]
    can :ru, [ RepairOrder ]
    can :crud, [ RepairItem ]
  end

end

# The first argument to `can` is the action you are giving the user
# permission to do.
# If you pass :manage it will apply to every action. Other common actions
# here are :read, :create, :update and :destroy.
#
# The second argument is the resource the user can perform the action on.
# If you pass :all it will apply to every resource. Otherwise pass a Ruby
# class of the resource.
#
# The third argument is an optional hash of conditions to further filter the
# objects.
# For example, here the user can only update published articles.
#
#   can :update, Article, :published => true
#
# See the wiki for details:
# https://github.com/ryanb/cancan/wiki/Defining-Abilities
