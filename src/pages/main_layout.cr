abstract class MainLayout
  include Lucky::HTMLPage

  # 'needs current_user : User' makes it so that the current_user
  # is always required for pages using MainLayout
  needs current_user : User

  abstract def content
  abstract def page_title

  # MainLayout defines a default 'page_title'.
  #
  # Add a 'page_title' method to your indivual pages to customize each page's
  # title.
  #
  # Or, if you want to require every page to set a title, change the
  # 'page_title' method in this layout to:
  #
  #    abstract def page_title : String
  #
  # This will force pages to define their own 'page_title' method.
  def page_title
    I18n.t("app.welcome")
  end

  def render
    html_doctype

    html lang: "fr" do
      mount Shared::LayoutHead.new(page_title: page_title, context: context)
      body do
        tag("section", class: "main-content columns is-fullheight") do
          mount Shared::LayoutMenu.new(current_user)
          div(class: "container column is-10 ") do
            div(class: "section") do
              # mount Shared::FlashMessages.new(context.flash)
              content
            end
          end
        end
      end
    end
  end
end
