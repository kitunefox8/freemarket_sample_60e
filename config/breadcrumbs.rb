crumb :root do
  link "トップページ", root_path, class: 'top'
end

crumb :mypage do
  link "マイページ", mypage_user_path(current_user)
end

crumb :profile do
  link "プロフィール", profile_users_path
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