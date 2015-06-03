class WikiMonitor < ActiveRecord::Base
  unloadable

  def self.total_summary()
    ActiveRecord::Base.connection.select_all("SELECT count(*) number_of_pages, sum(length(C.text)) number_of_characters, sum(C.version) number_of_revisions, P.name project_name
    FROM wiki_contents C,
      (SELECT P.id, W.name
      FROM wiki_pages P,
        (SELECT W.id, P.name
        FROM wikis W,
          (SELECT id, name
          FROM projects
          ) P
        WHERE W.project_id = P.id
        ) W
      WHERE W.id = P.wiki_id
      ) P
    WHERE C.page_id = P.id
    GROUP BY P.name")
  end
end
