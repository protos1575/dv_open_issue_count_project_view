module ProjectsHelperPatch
  def self.included(base)
    base.class_eval do

      # Renders the projects index
      def render_project_hierarchy_with_plugin(projects)
        render_project_nested_lists(projects) do |project|

          cond = project.project_condition(Setting.display_subprojects_issues?)

          open_issues = Issue.visible.open.where(cond).count

          linked_open_issues = link_to open_issues.to_i, project_issues_path(project, :set_filter => 1)

          s = link_to_project(project, {}, :class => "#{project.css_classes} #{User.current.member_of?(project) ? 'icon icon-fav my-project' : nil}") + " " + linked_open_issues
          if project.description.present?
            s << content_tag('div', textilizable(project.short_description, :project => project), :class => 'wiki description')
          end
          s
        end
      end

      alias_method_chain :render_project_hierarchy, :plugin

    end
  end
end