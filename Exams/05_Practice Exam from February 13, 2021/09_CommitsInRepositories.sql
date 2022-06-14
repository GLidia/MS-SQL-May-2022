-- Problem Description: Select the top 5 repositories in terms of count of commits.
-- Order them by commits count (descending), repository id (ascending) then by repository name (ascending).

-- The following solution returns the answer in Judge, but it does not necessarily correspond to the problem description:
SELECT TOP(5) r.Id, r.[Name], COUNT(*) AS Commits
	 FROM RepositoriesContributors AS rc
	 JOIN Repositories AS r ON r.Id = rc.RepositoryId
	 JOIN Commits AS c ON c.RepositoryId = r.Id
	 GROUP BY r.Id, r.[Name]
	 ORDER BY Commits DESC, r.Id ASC, r.[Name] ASC