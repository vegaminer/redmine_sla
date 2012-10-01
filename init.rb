Redmine::Plugin.register :redmine_sla do
  name 'Redmine SLA plugin'
  author 'Emmanuel GALLOIS'
  description 'Assign due date according a SLA specified with the issue category.'
  version '0.0.1'
  url 'http://github.com/undx/redmine_sla'
  author_url 'http://emmanuel.gallois.me'
  
  require_dependency 'project'
  require_dependency 'issue_category'
  # monkey-patch IssueCategory and Issue
  IssueCategory.class_eval do
    safe_attributes 'sla_default', 'sla_vip'
  end
  require_dependency 'issue'
  Issue.class_eval do
    before_save :sla_service
    def sla_service
      logger.debug{"[SLA plugin] author: #{author}; category: #{category}"}
      return if category.nil?
      if author.respond_to? :vip?
        sla = category.sla_default unless author.vip?
        sla = category.sla_vip         if author.vip?
      else
        sla = category.sla_default
      end
      return if sla == 0
      sla_due = start_date+sla.day
      self.due_date = sla_due
    end
  end
end
