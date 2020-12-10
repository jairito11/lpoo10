Rails.application.routes.draw do
  #get 'sesiones/login'
  resources :usuarios
  #get 'paises/inicio'
  #get 'estados/inicio'
  match '/estados' => 'estados#inicio',via: :get, :as => :estados_inicio
  match '/estado/:id/mostrar' => 'estados#mostrar', via: :get, :as => :mostrar_estado


  match '/estado/nuevo' => 'estados#nuevo', via: :get, :as => :nuevo_estado
  match '/estado/crear' => 'estados#crear', via: :post, :as => :crear_estado
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/estado/:id/editar' => 'estados#editar', via: :get, :as => :editar_estado
  match '/estado/actualizar' => 'estados#actualizar', via: :patch, :as => :actualizar_estado

  match '/estado/:id/eliminar' => 'estados#eliminar', via: :delete, :as => :eliminar_estado

  #paises
  match '/paises' => 'paises#inicio', via: :get, :as => :paises_inicio
  match '/pais/:id/mostrar' => 'paises#mostrar', via: :get, :as => :mostrar_pais
  match '/pais/nuevo' => 'paises#nuevo', via: :get, :as => :nuevo_pais
  match '/pais/crear' => 'paises#crear', via: :post, :as => :crear_pais
  match '/pais/:id/editar' => 'paises#editar', via: :get, :as => :editar_pais
  match '/pais/actualizar' => 'paises#actualizar', via: :patch, :as => :actualizar_pais
  match '/pais/:id/eliminar' => 'paises#eliminar', via: :delete, :as => :eliminar_pais

  #Buscador
  match '/buscar_usuario' => 'usuarios#index', via: :post, :as => :buscar_usuario 
  match '/validar_rfc' => 'usuarios#validar_rfc', via: :get, :as => :validar_rfc_usuario

  match '/login' => 'sesiones#login', via: :get, :as => :login
  match '/login' => 'sesiones#validar_usuario', via: :post, :as => :login_post
  match '/cerrar_sesion' => 'sesiones#cerrar_sesion', via: :get, :as => :cerrar_sesion
  
end
