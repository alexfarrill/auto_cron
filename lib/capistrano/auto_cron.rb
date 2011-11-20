Capistrano::Configuration.instance.load do
  namespace :auto_cron do
    task :publish, :roles => :publish do
      run "cd #{release_path} && #{rake} TEMPLATES=#{fetch(:auto_cron_templates, %w( publish )).join(",")} APPLICATION=#{application} RAILS_ENV=#{rails_env} auto_cron"
    end
  end
end