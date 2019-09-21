Rails.application.routes.draw do

  get "nice_tasks", to: 'nice_tasks#index', as: :nice_tasks
  get "nice_tasks/similarity_map.json", to: 'nice_tasks#show_similarity_map', as: :nice_tasks_similarity_map
  get "nice_tasks/:acronym", to: 'nice_tasks#show', as: :nice_task

  get "nice_abilities", to: 'nice_abilities#index', as: :nice_abilities
  get "nice_abilities/similarity_map.json", to: 'nice_abilities#show_similarity_map', as: :nice_abilities_similarity_map
  get "nice_abilities/:acronym", to: 'nice_abilities#show', as: :nice_ability

  get "nice_skills", to: 'nice_skills#index', as: :nice_skills
  get "nice_skills/similarity_map.json", to: 'nice_skills#show_similarity_map', as: :nice_skills_similarity_map
  get "nice_skills/:acronym", to: 'nice_skills#show', as: :nice_skill

  get "nice_knowledge", to: 'nice_knowledges#index', as: :nice_knowledges
  get "nice_knowledge/similarity_map.json", to: 'nice_knowledges#show_similarity_map', as: :nice_knowledge_similarity_map
  get "nice_knowledge/:acronym", to: 'nice_knowledges#show', as: :nice_knowledge
  
  get "nice_areas", to: 'nice_areas#index', as: :nice_areas
  get "nice_areas/:acronym", to: 'nice_areas#show', as: :nice_area

  get "nice_categories", to: 'nice_categories#index', as: :nice_categories
  get "nice_categories/:acronym", to: 'nice_categories#show', as: :nice_category
  
  get "nice_work_roles", to: 'nice_work_roles#index', as: :nice_work_roles
  get "nice_work_roles/:acronym", to: 'nice_work_roles#show', as: :nice_work_role
  get "nice_work_roles/:acronym/:dimension.json", to: 'nice_work_roles#show_dimension', as: :nice_work_role_dimension
  get "nice_work_roles/:acronym/:dimension/similarity_map.json", to: 'nice_work_roles#show_similarity_map', as: :nice_work_role_similarity_map

  get "about", to: "static#about", as: :about
  get "index", to: "static#index", as: :index
  
  root to: "static#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
