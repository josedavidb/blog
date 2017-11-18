Rails.application.routes.draw do


  
  devise_for :users
	resources :articles do
		resources :comments
	end

=begin
		get "/articles" index
		post "/articles" create
		delete "/articles" delete
=end


  root 'welcome#index' do

  	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end