Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"   #ルートパスへアクセスがあったら、itemsコントローラーのindexアクションを呼び出す
end
