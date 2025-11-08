# frozen_string_literal: true

Rails.application.routes.draw do
  mount UsageMeter::Engine => '/usage_meter'
end
