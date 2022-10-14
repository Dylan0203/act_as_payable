Rails.application.routes.draw do
  mount ActAsSubscriptable::Engine => "/act_as_subscriptable"
end
