Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/api/v2/graphql"
  end

  namespace :api do
    namespace :v1 do
      resources :airlines, param: :slug
    end

    namespace :v2 do
      match "graphql", to: "graphql#execute", via: %i[get post delete]
    end
  end

end
