crumb :root do
  link "トップページ", root_path, class: 'top'
end

crumb :mypage do
  link "マイページ", mypage_users_path
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

crumb :index do
  link "カテゴリ一覧", categories_path
end

crumb :show do |category|
  link category.name, category_path(category)
  parent :index
end

# カテゴリー子要素パンくず
# crumb :show do |category|
#   link category.children.name, category_path(category)
#   parent :show
# end


# 今後使用するかも知れないのでコメントアウト
# crumb :show do |product|
#   link product.name 
# end
# - breadcrumb :show, @product
# = render "layouts/breadcrumbs"

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).