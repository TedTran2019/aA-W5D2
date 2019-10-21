# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                 users POST   /users(.:format)                                                                         users#create
#                              new_user GET    /users/new(.:format)                                                                     users#new
#                           new_session GET    /session/new(.:format)                                                                   sessions#new
#                               session DELETE /session(.:format)                                                                       sessions#destroy
#                                       POST   /session(.:format)                                                                       sessions#create
#                                  subs GET    /subs(.:format)                                                                          subs#index
#                                       POST   /subs(.:format)                                                                          subs#create
#                               new_sub GET    /subs/new(.:format)                                                                      subs#new
#                              edit_sub GET    /subs/:id/edit(.:format)                                                                 subs#edit
#                                   sub GET    /subs/:id(.:format)                                                                      subs#show
#                                       PATCH  /subs/:id(.:format)                                                                      subs#update
#                                       PUT    /subs/:id(.:format)                                                                      subs#update
#                      new_post_comment GET    /posts/:post_id/comments/new(.:format)                                                   comments#new
#                                 posts POST   /posts(.:format)                                                                         posts#create
#                              new_post GET    /posts/new(.:format)                                                                     posts#new
#                             edit_post GET    /posts/:id/edit(.:format)                                                                posts#edit
#                                  post GET    /posts/:id(.:format)                                                                     posts#show
#                                       PATCH  /posts/:id(.:format)                                                                     posts#update
#                                       PUT    /posts/:id(.:format)                                                                     posts#update
#                                       DELETE /posts/:id(.:format)                                                                     posts#destroy
#                              comments POST   /comments(.:format)                                                                      comments#create
#                                  root GET    /                                                                                        subs#index
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Auth
  resources :users, only: [:create, :new]
  resource :session, only: [:create, :destroy, :new]

  resources :subs, except: [:destroy]
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end

  resources :comments, only: [:create, :show]

  root 'subs#index'
end
