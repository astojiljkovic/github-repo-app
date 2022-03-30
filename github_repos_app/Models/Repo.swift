//
//  Repo.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 26.3.22..
//

import Foundation


struct ReposResponse: Codable {
    let items: [Repo]
}

struct Repo: Codable {
//    let allow_forking: Int
    let name: String?
    let full_name: String?
    let description: String?
    let forks_count: Int?
    let stargazers_count: Int?
    let id: Int
    let owner: Owner
}
struct Owner: Codable {
    let avatar_url: String?
}
/*
 
"allow_forking" = 1;
"archive_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/{archive_format}{/ref}";
archived = 0;
"assignees_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/assignees{/user}";
"blobs_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/git/blobs{/sha}";
"branches_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/branches{/branch}";
"clone_url" = "https://github.com/HarbourMasters/Shipwright.git";
"collaborators_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/collaborators{/collaborator}";
"comments_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/comments{/number}";
"commits_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/commits{/sha}";
"compare_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/compare/{base}...{head}";
"contents_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/contents/{+path}";
"contributors_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/contributors";
"created_at" = "2022-03-22T01:42:52Z";
"default_branch" = develop;
"deployments_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/deployments";
description = "<null>";
disabled = 0;
"downloads_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/downloads";
"events_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/events";
fork = 0;
forks = 87;
"forks_count" = 87;
"forks_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/forks";
"full_name" = "HarbourMasters/Shipwright";
"git_commits_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/git/commits{/sha}";
"git_refs_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/git/refs{/sha}";
"git_tags_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/git/tags{/sha}";
"git_url" = "git://github.com/HarbourMasters/Shipwright.git";
"has_downloads" = 1;
"has_issues" = 1;
"has_pages" = 0;
"has_projects" = 1;
"has_wiki" = 1;
homepage = "<null>";
"hooks_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/hooks";
"html_url" = "https://github.com/HarbourMasters/Shipwright";
id = 472575717;
"is_template" = 0;
"issue_comment_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/issues/comments{/number}";
"issue_events_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/issues/events{/number}";
"issues_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/issues{/number}";
"keys_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/keys{/key_id}";
"labels_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/labels{/name}";
language = C;
"languages_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/languages";
license = "<null>";
"merges_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/merges";
"milestones_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/milestones{/number}";
"mirror_url" = "<null>";
name = Shipwright;
"node_id" = "R_kgDOHCru5Q";
"notifications_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/notifications{?since,all,participating}";
"open_issues" = 73;
"open_issues_count" = 73;
owner =             {
 "avatar_url" = "https://avatars.githubusercontent.com/u/88675208?v=4";
 "events_url" = "https://api.github.com/users/HarbourMasters/events{/privacy}";
 "followers_url" = "https://api.github.com/users/HarbourMasters/followers";
 "following_url" = "https://api.github.com/users/HarbourMasters/following{/other_user}";
 "gists_url" = "https://api.github.com/users/HarbourMasters/gists{/gist_id}";
 "gravatar_id" = "";
 "html_url" = "https://github.com/HarbourMasters";
 id = 88675208;
 login = HarbourMasters;
 "node_id" = MDEyOk9yZ2FuaXphdGlvbjg4Njc1MjA4;
 "organizations_url" = "https://api.github.com/users/HarbourMasters/orgs";
 "received_events_url" = "https://api.github.com/users/HarbourMasters/received_events";
 "repos_url" = "https://api.github.com/users/HarbourMasters/repos";
 "site_admin" = 0;
 "starred_url" = "https://api.github.com/users/HarbourMasters/starred{/owner}{/repo}";
 "subscriptions_url" = "https://api.github.com/users/HarbourMasters/subscriptions";
 type = Organization;
 url = "https://api.github.com/users/HarbourMasters";
};
private = 0;
"pulls_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/pulls{/number}";
"pushed_at" = "2022-03-28T06:00:50Z";
"releases_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/releases{/id}";
score = 1;
size = 49795;
"ssh_url" = "git@github.com:HarbourMasters/Shipwright.git";
"stargazers_count" = 631;
"stargazers_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/stargazers";
"statuses_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/statuses/{sha}";
"subscribers_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/subscribers";
"subscription_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/subscription";
"svn_url" = "https://github.com/HarbourMasters/Shipwright";
"tags_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/tags";
"teams_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/teams";
topics =             (
);
"trees_url" = "https://api.github.com/repos/HarbourMasters/Shipwright/git/trees{/sha}";
"updated_at" = "2022-03-28T10:35:03Z";
url = "https://api.github.com/repos/HarbourMasters/Shipwright";
visibility = public;
watchers = 631;
"watchers_count" = 631;
 */
