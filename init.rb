Redmine::Plugin.register :redmine_wiki_monitor do
  name 'Redmine Wiki Monitor plugin'
  author 'Seungyoon Lee'
  description 'This is a plugin for Redmine that shows wiki stats'
  version '0.0.1'
  url 'https://github.com/ManBitesDog/Redmine-Wiki-Monitor'
  author_url 'https://wpsamsee.wordpress.com/2015/05/15/%EB%A0%88%EB%93%9C%EB%A7%88%EC%9D%B8-%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8-%EA%B0%9C%EB%B0%9C%ED%95%98%EA%B8%B0-%EC%9C%84%ED%82%A4-%EB%AA%A8%EB%8B%88%ED%84%B0%EB%A7%81/'

  requires_redmine :version_or_higher => '2.6.0'
    
end
 