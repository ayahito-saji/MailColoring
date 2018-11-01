Rails.application.routes.draw do

  scope :v1 do
    get 'debug/neologd', to: 'debug#neologd'
    get 'debug/mail_coloring', to: 'debug#mail_coloring'
    post 'mail_coloring', to: 'mail_coloring#mail_coloring'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
