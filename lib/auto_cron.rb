class AutoCron
  def self.auto_cron( template )
    require 'erb'
    auto_cron_dir = File.join RAILS_ROOT, "config/auto_cron"
    header_template = File.join auto_cron_dir, 'header.erb' 
    header = if File.exist?( header_template )
      ERB.new( File.read( header_template ) ).result
    else
      ''
    end
    full_template_path = File.join auto_cron_dir, "%s.erb" % template
    header + "\n\n" + ERB.new( File.read( full_template_path ) ).result
  end
end