ActionController::Routing::Routes.draw do |map|

  map.root :controller=>'votes', :action=>'new'
  map.resources :votes, :only=>[:new, :create], :collection=>{:totals=>:get}

end
