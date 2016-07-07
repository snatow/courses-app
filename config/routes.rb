Rails.application.routes.draw do
  root to: 'courses#index'
  devise_for :users
  resources :courses do
    member do
      put 'add_student'
      delete 'remove_student'
    end
  end
  resources :students do
    member do
      put 'add_course'
      delete 'remove_course'
    end
  end
end

##ROUTES

#                   Prefix Verb   URI Pattern                           Controller#Action
#                     root GET    /                                     courses#index
#         new_user_session GET    /users/sign_in(.:format)              devise/sessions#new
#             user_session POST   /users/sign_in(.:format)              devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)             devise/sessions#destroy
#            user_password POST   /users/password(.:format)             devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)         devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)        devise/passwords#edit
#                          PATCH  /users/password(.:format)             devise/passwords#update
#                          PUT    /users/password(.:format)             devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)               devise/registrations#cancel
#        user_registration POST   /users(.:format)                      devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)              devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                 devise/registrations#edit
#                          PATCH  /users(.:format)                      devise/registrations#update
#                          PUT    /users(.:format)                      devise/registrations#update
#                          DELETE /users(.:format)                      devise/registrations#destroy
#       add_student_course PUT    /courses/:id/add_student(.:format)    courses#add_student
#    remove_student_course DELETE /courses/:id/remove_student(.:format) courses#remove_student
#                  courses GET    /courses(.:format)                    courses#index
#                          POST   /courses(.:format)                    courses#create
#               new_course GET    /courses/new(.:format)                courses#new
#              edit_course GET    /courses/:id/edit(.:format)           courses#edit
#                   course GET    /courses/:id(.:format)                courses#show
#                          PATCH  /courses/:id(.:format)                courses#update
#                          PUT    /courses/:id(.:format)                courses#update
#                          DELETE /courses/:id(.:format)                courses#destroy
#       add_course_student PUT    /students/:id/add_course(.:format)    students#add_course
#    remove_course_student DELETE /students/:id/remove_course(.:format) students#remove_course
#                 students GET    /students(.:format)                   students#index
#                          POST   /students(.:format)                   students#create
#              new_student GET    /students/new(.:format)               students#new
#             edit_student GET    /students/:id/edit(.:format)          students#edit
#                  student GET    /students/:id(.:format)               students#show
#                          PATCH  /students/:id(.:format)               students#update
#                          PUT    /students/:id(.:format)               students#update
#                          DELETE /students/:id(.:format)               students#destroy
