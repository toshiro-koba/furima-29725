Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"   #ルートパスへアクセスがあったら、itemsコントローラーのindexアクションを呼び出す
end
