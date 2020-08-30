Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"   #ルートパスへアクセスがあったら、itemsコントローラーのindexアクションを呼び出す
end
