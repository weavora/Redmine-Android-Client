ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => 'api_activities', :action => 'index' do |activity|
    activity.connect 'projects/:id/activities.xml', :format => /xml/
    activity.connect 'activities.xml', :id => nil, :format => /xml/
  end
end


#ActionController::Routing::Routes.draw do |map|
#  map.with_options :controller => 'reposearch' do |reposearch|
#    reposearch.connect 'projects/:id/reposearch', :action => 'search'
#    reposearch.connect 'reposearch', :action => 'search'
#  end
#  map.with_options :controller => 'repoindexer' do |repoindexer|
#    repoindexer.connect 'repoindexer/init/:id', :action => 'indexing', :conditions => {:method => :get}, :init => true
#    repoindexer.connect 'repoindexer/crawl/:id', :action => 'indexing', :conditions => {:method => :get}, :init => false
#  end
#end