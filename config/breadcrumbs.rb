crumb :root do
  link "FURIMA", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", user_path
end

# ログアウトページ
crumb :logout do
  link "ログアウト", sign_out_path
  parent :mypage
end

# カテゴリ一覧ページ
crumb :categories do
  link "カテゴリ一覧", categories_path
end

# カテゴリページ
crumb :category do
  @category = Category.find(params[:id])
  if params[:id] == @category.root.id.to_s
    link "#{Category.find(params[:id]).name}", category_path
  elsif /^[0-9]+$/ =~ @category.ancestry 
    link "#{Category.find(params[:id]).root.name}", category_path(Category.find(params[:id]).root.id)
    link "#{Category.find(params[:id]).name}", category_path
  else
    link "#{Category.find(params[:id]).root.name}", category_path(Category.find(params[:id]).root.id)
    link "#{Category.find(params[:id]).parent.name}", category_path(Category.find(params[:id]).parent.id)
    link "#{Category.find(params[:id]).name}", category_path
  end
  parent :categories
end

# crumb :root do
#   link "Home", root_path
# end

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