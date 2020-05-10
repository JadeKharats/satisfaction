class Shared::LayoutMenu < BaseComponent
  needs user : User
  def render
    tag("aside", class: "column is-2 is-narrow-mobile is-fullheight section is-hidden-mobile") do
      if user.admin?
        tag("p", class: "menu-label") do
          text "General"
        end
        ul(class: "menu-list") do
          li do
            a "DashBoard", href: "/"
          end
        end
        tag("p", class: "menu-label") do
          text "Sessions"
        end
        ul(class: "menu-list") do
          li do
            link "Créer", to: Sessions::New
          end
          li do
            link "Liste", to: Sessions::Index
          end
        end
        tag("p", class: "menu-label") do
          text "Participants"
        end
        ul(class: "menu-list") do
          li do
            link "Créer", to: Participants::New
          end
          li do
            link "Liste", to: Participants::Index
          end
        end
        tag("p", class: "menu-label") do
          text "Utilisateurs"
        end
        ul(class: "menu-list") do
          li do
            link "Liste", Users::Index
          end
        end
      end
      tag("p", class: "menu-label") do
        text "Profile"
      end
      ul(class: "menu-list") do
        li do
          link "Moi", to: Me::Show
        end
        li do
          link "Sortir", to: SignIns::Delete, flow_id: "sign-out-button"
        end
      end
    end
  end
end
