class Shared::LayoutMenu < BaseComponent
  needs user : User
  def render
    tag("aside", class: "column is-2 is-narrow-mobile is-fullheight section is-hidden-mobile") do
      tag("p", class: "menu-label") do
        text "General"
      end
      ul(class: "menu-list") do
        li do
          a "DashBoard", href: "/"
        end
      end
      tag("p", class: "menu-label") do
        text "Formations"
      end
      ul(class: "menu-list") do
        li do
          a "Creer", href: "/"
        end
        li do
          a "Liste", href: "/"
        end
      end
      tag("p", class: "menu-label") do
        text "Formateurs"
      end
      ul(class: "menu-list") do
        li do
          a "Creer", href: "/"
        end
        li do
          a "Liste", href: "/"
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
          link "Sortir", to: SignIns::Delete
        end
      end
    end
  end
end
