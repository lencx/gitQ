import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  String login;

  num id;

  @JsonKey(name: "node_id")
  String nodeId;

  @JsonKey(name: "avatar_url")
  String avatarUrl;

  @JsonKey(name: "gravatar_id")
  String gravatarId;

  String url;

  @JsonKey(name: "html_url")
  String htmlUrl;

  @JsonKey(name: "followers_url")
  String followersUrl;

  @JsonKey(name: "following_url")
  String followingUrl;

  @JsonKey(name: "gists_url")
  String gistsUrl;

  @JsonKey(name: "starred_url")
  String starredUrl;

  @JsonKey(name: "subscriptions_url")
  String subscriptionsUrl;

  @JsonKey(name: "organizations_url")
  String organizationsUrl;

  @JsonKey(name: "repos_url")
  String reposUrl;

  @JsonKey(name: "events_url")
  String eventsUrl;

  @JsonKey(name: "received_events_url")
  String receivedEventsUrl;

  String type;

  @JsonKey(name: "site_admin")
  bool siteAdmin;

  String name;

  String company;

  String blog;

  String location;

  String email;

  bool hireable;

  String bio;

  @JsonKey(name: "public_repos")
  num publicRepos;

  @JsonKey(name: "public_gists")
  num publicGists;

  num followers;

  num following;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Map<String, dynamic> plan;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
