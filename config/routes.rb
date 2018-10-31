Rails.application.routes.draw do

  scope :v1 do
    get 'debug/neologd', to: 'debug#neologd'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
