module ActAsSubscriptable
  class Engine < ::Rails::Engine
    isolate_namespace ActAsSubscriptable

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
