class Menu < ApplicationRecord
  #def self.active_menu
  #  all.where(active: true).first
  #end

  def is_active?
    if self.active
      return true
    end
  end

  def is_not_active?
    if self.active
      return false
    end
    return true
  end
end
