Rails.application.routes.draw do

  get "nice_tasks", to: 'nice_tasks#index', as: :nice_tasks
  get "nice_tasks/:task_code", to: 'nice_tasks#show', as: :nice_task

  get "nice_knowledges", to: 'nice_knowledges#index', as: :nice_knowledges
  get "nice_knowledges/:knowledge_code", to: 'nice_knowledges#show', as: :nice_knowledge
  
  get "nice_skills", to: 'nice_skills#index', as: :nice_skills
  get "nice_skills/:skill_code", to: 'nice_skills#show', as: :nice_skill

  get "nice_competencies", to: 'nice_competencies#index', as: :nice_competencies
  get "nice_competencies/:competency_code", to: 'nice_competencies#show', as: :nice_competency

  get "nice_categories", to: 'nice_categories#index', as: :nice_categories
  get "nice_categories/:category_code", to: 'nice_categories#show', as: :nice_category
  
  get "nice_work_roles", to: 'nice_work_roles#index', as: :nice_work_roles
  get "nice_work_roles/:work_role_code", to: 'nice_work_roles#show', as: :nice_work_role

  get "about", to: "static#about", as: :about
  get "index", to: "static#index", as: :index
  
  root to: "static#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
