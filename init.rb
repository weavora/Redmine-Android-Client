require 'redmine'

#require 'activities_controller_patch'
begin
require 'config/initializers/session_store.rb'
rescue LoadError
end

Redmine::Plugin.register :redmine_android_client do
  name 'Redmine Android Client plugin'
  author 'Weavora LLC'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://github.com/weavora/android-activity-api/'
  author_url 'http://weavora.com'

  project_module :api_activities do
    permission :index_api_activities, {:api_activities => [:index]}, :require => :member
  end
end
