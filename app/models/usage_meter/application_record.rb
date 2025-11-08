# frozen_string_literal: true

module UsageMeter
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
