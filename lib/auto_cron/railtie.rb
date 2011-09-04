require 'auto_cron'
require 'rails'

class Railtie < Rails::Railtie
  rake_tasks do
    load "tasks/auto_cron_tasks.rake"
  end
end
