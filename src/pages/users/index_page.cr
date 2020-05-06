class Users::IndexPage < MainLayout
  needs users : UserQuery
  quick_def page_title, "Tous les utilisateurs"

  def content
    h1 "Toutes les utilisateurs"
    render_users
  end

  def render_users
    @users.each do |user|
      div class: "card" do
        text "#{user.email}"
        if user.admin?
          tag("span", class: "tag is-danger") do
            text "Admin"
          end
        end
      end
    end
  end
end
