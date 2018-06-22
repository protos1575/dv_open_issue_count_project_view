Redmine::Plugin.register :dv_open_issue_count_project_view do
  name 'Dv Open Issue Count Project View plugin'
  author 'Carlos Meyer'
  description 'Shows open issue count on project view page'
  version '0.0.1'
  url 'https://github.com/protos1575/dv_open_issue_count_project_view'
  author_url 'https://www.davitec.de'
end

Rails.configuration.to_prepare do
  # This tells the Redmine version's controller to include the module from the file above.
  ProjectsHelper.send(:include, ProjectsHelperPatch)
end