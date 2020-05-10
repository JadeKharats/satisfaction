class Shared::LayoutMenu < BaseComponent
  needs user : User
  def render
    tag("aside", class: "column is-2 is-narrow-mobile is-fullheight section is-hidden-mobile") do
      if user.admin?
        tag("p", class: "menu-label") do
          text I18n.t("menu.general.title")
        end
        ul(class: "menu-list") do
          li do
            a I18n.t("menu.general.board"), href: "/"
          end
        end
        tag("p", class: "menu-label") do
          text I18n.t("menu.sessions.title")
        end
        ul(class: "menu-list") do
          li do
            link I18n.t("menu.sessions.add"), to: Sessions::New
          end
          li do
            link I18n.t("menu.sessions.list"), to: Sessions::Index
          end
        end
        tag("p", class: "menu-label") do
          text I18n.t("menu.attendees.title")
        end
        ul(class: "menu-list") do
          li do
            link I18n.t("menu.attendees.add"), to: Participants::New
          end
          li do
            link I18n.t("menu.attendees.list"), to: Participants::Index
          end
        end
        tag("p", class: "menu-label") do
          text I18n.t("menu.users.title")
        end
        ul(class: "menu-list") do
          li do
            link I18n.t("menu.users.list"), Users::Index
          end
        end
      end
      tag("p", class: "menu-label") do
        text I18n.t("menu.profil.title")
      end
      ul(class: "menu-list") do
        li do
          link I18n.t("menu.profil.me"), to: Me::Show
        end
        li do
          link I18n.t("menu.profil.logout"), to: SignIns::Delete, flow_id: "sign-out-button"
        end
      end
    end
  end
end
