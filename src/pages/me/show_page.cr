class Me::ShowPage < MainLayout
  def content
    div(class: "card") do
      render_profil
    end
  end

  private def render_profil
    div(class: "card-content") do
      div(class: "media") do
        div(class: "media-left") do
          tag("figure", class: "image is-48x48") do
            img(src: "https://bulma.io/images/placeholders/96x96.png")
          end
        end
        div(class: "media-content") do
          tag("p", class: "title is-4") do
            text "#{@current_user.email}"
          end
          if @current_user.admin?
            tag("p", class: "subtitle is-6", flow_id: "Admin-flag") do
              text I18n.t("me.admin")
            end
          end
        end
      end
    end
  end
end
