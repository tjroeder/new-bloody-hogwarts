class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_alphabetical
    order(name: :asc)
  end
end
