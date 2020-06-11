class LinkMenuItem < ActiveRecord::Base
  belongs_to :menus, optional: true
  def self.check_menu_item(menu_id, menu_item_id)
    LinkMenuItem.all.each do |link|
      if link.menu_id == menu_id && link.menu_item_id == menu_item_id
        return true
      end
    end
    return false
  end
  def self.find_link(id1, id2)
    LinkMenuItem.all.each do |link|
      if link.menu_id == id1 && link.menu_item_id == id2
        return link
      end
    end
  end
end
