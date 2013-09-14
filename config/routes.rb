HighchartsBootstrap::Application.routes.draw do
  resources :charts do
    collection do
      get 'basic_line'
      get 'line_ajax'
      get 'line_labels'
    end
  end

  root :to => 'visitors#new'
end
