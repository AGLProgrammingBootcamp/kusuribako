Rails.application.routes.draw do
  get 'medicines/new'=>'medicines#new'
  post 'medicines'=>'medicines#create'
  get 'medicines' =>'medicines#index'
  
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

end