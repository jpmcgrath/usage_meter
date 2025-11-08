Rails.application.routes.draw do
  mount UsageMeter::Engine => '/usage_meter'
end
