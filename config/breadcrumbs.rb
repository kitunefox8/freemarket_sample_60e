crumb :root do
  link "トップページ", root_path, class: 'top'
end

crumb :mypage do
  link "マイページ", mypage_user_path(current_user)
end

crumb :product do |product|
  link product.name, product_path(product.id)
  parent :root
end

crumb :profile do
  link "プロフィール", edit_user_path(current_user)
  parent :mypage
end

crumb :creditcard do
  link "支払い方法", creditcard_users_path
  parent :mypage
end

crumb :person do
  link "本人情報の登録", person_users_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

crumb :standby do
  link "マイページトップに戻る", standby_users_path
  parent :mypage
end

crumb :seller do
  link "出品した商品 - 出品中", seller_users_path(current_user)
  parent :mypage
end

crumb :negotiation do
  link "出品した商品 - 取引中", negotiation_users_path(current_user)
  parent :mypage
end

crumb :sell do
  link "出品した商品 - 売却済", sell_users_path(current_user) 
  parent :mypage
end

crumb :buy do
  link "購入した商品 - 取引中", buy_users_path(current_user)
  parent :mypage
end

crumb :sold do
  link "購入した商品 -過去の取引", sold_users_path(current_user)
  parent :mypage
end

crumb :categories do
  link "カテゴリ一覧", categories_path
end

crumb :parent_category do |category|
  link category.root.name, category_path(category.root.id)
  parent :categories
end

crumb :child_category do |category|
  if category.has_parent? && category.has_children? then
    link category.name, category_path(category.id)
    parent :parent_category, category
  else
    if category.parent.blank? then
      parent :parent_category, category
    else
      link category.parent.name, category_path(category.parent.id)
      parent :parent_category, category
    end
  end
end

crumb :grand_child_category do |category|
  if category.has_parent? && category.has_children? then
    parent :child_category, category
  else
    if category.children.blank? then
      link category.name, category_path(category.id)
      parent :child_category, category
    else
      parent :child_category, category
    end
  end
end