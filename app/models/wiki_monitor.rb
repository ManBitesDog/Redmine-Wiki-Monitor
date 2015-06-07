class WikiMonitor < ActiveRecord::Base
  unloadable

  def self.total_summary()
    ActiveRecord::Base.connection.select_all("select COUNT(*) NUMBER_OF_PAGES, 
     SUM(CHAR_LENGTH(C.TEXT)) NUMBER_OF_CHARACTERS, 
     SUM(C.VERSION) NUMBER_OF_REVISIONS, 
     P.NAME PROJECT_NAME
      from WIKI_CONTENTS C,
        (select P.ID, W.NAME
        from WIKI_PAGES P,
          (select W.ID, P.NAME
          from WIKIS W,
            (select ID, NAME
            from PROJECTS
            ) P
          where W.PROJECT_ID = P.ID
          ) W
        where W.ID = P.WIKI_ID
        ) P
      where C.PAGE_ID = P.ID
      group by P.NAME")
  end
  
  def self.by_users()
    ActiveRecord::Base.connection.select_all("select SUM(CASE WHEN VERSION = 1 THEN 0 ELSE 1 END) NUMBER_OF_EDITED, 
      SUM(CASE WHEN VERSION = 1 THEN 1 ELSE 0 END) NUMBER_OF_CREATED, 
        COUNT(*) NUMBER_OF_TOUCHED, 
        (select concat(lastname, firstname) as user_name from USERS where USERS.id = AUTHOR_ID) USER_NAME
    from (select PAGE_ID, 
        VERSION, 
        AUTHOR_ID
      from WIKI_CONTENT_VERSIONS
      where 1 = 1) V
    where 1 = 1
    group by AUTHOR_ID
    order by COUNT(*) desc
    ")
  end
end
