local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-pass') {
  settings+: {
    default_repository_permission: "none",
    dependabot_alerts_enabled_for_new_repositories: false,
    dependabot_security_updates_enabled_for_new_repositories: false,
    dependency_graph_enabled_for_new_repositories: false,
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse Pass",
    packages_containers_internal: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('GH_PAT') {
      value: "********",
    },
    orgs.newOrgSecret('GH_USER') {
      value: "********",
    },
    orgs.newOrgSecret('MAVEN_GPG_KEY') {
      value: "********",
    },
    orgs.newOrgSecret('MAVEN_GPG_PASSPHRASE') {
      value: "********",
    },
    orgs.newOrgSecret('OSSRH_PASSWORD') {
      value: "********",
    },
    orgs.newOrgSecret('OSSRH_USERNAME') {
      value: "********",
    },
  ],
  _repositories+:: [
    orgs.newRepo('eclipse-pass.github.io') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('main') {
      allow_update_branch: false,
      description: "Catch all repository against which issues of general, cross cutting topics are logged.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('AWS_ACCESS_KEY_ID') {
          value: "********",
        },
        orgs.newRepoSecret('AWS_REGION') {
          value: "********",
        },
        orgs.newRepoSecret('AWS_SECRET_ACCESS_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('AWS_TOPIC_ARN') {
          value: "********",
        },
        orgs.newRepoSecret('EF_TEST_SECRET') {
          value: "********",
        },
        orgs.newRepoSecret('MAVEN_GPG_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('MAVEN_GPG_PASSPHRASE') {
          value: "********",
        },
        orgs.newRepoSecret('MY_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('OSSRH_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('OSSRH_USERNAME') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('modeshape') {
      allow_update_branch: false,
      default_branch: "master",
      description: "ModeShape is a distributed, hierarchical, transactional, and consistent data store with support for queries, full-text search, events, versioning, references, and flexible and dynamic schemas. It is very fast, highly available, extremely scalable, and it is 100% open source and written in Java. Clients use the JSR-283 standard Java API for content repositories (aka, JCR) or ModeShape's REST API, and can query content through JDBC and SQL.",
      has_issues: false,
      has_wiki: false,
      homepage: "http://www.modeshape.org",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-acceptance-testing') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-auth') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-authz') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Authorization helpers and user service",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-core') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('MAVEN_GPG_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('MAVEN_GPG_PASSPHRASE') {
          value: "********",
        },
        orgs.newRepoSecret('PASS_DOCKER_PAT') {
          value: "********",
        },
        orgs.newRepoSecret('PASS_DOCKER_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('PASS_DOCKER_USER') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('pass-data-migration') {
      allow_update_branch: false,
      default_branch: "initial",
      dependabot_alerts_enabled: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-data-model') {
      allow_update_branch: false,
      description: "The PASS data model",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('pass-deposit-services') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Deposit Services are responsible for the transfer of custodial content and metadata from end users to repositories.",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-docker') {
      allow_update_branch: false,
      description: "Developer-focused PASS runtime, which provides PASS and all of its dependent services using docker-compose.  Provides Docker images used for production deployment of PASS.",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-docker-mailserver') {
      allow_update_branch: false,
      description: "Provides SMTP and IMAP services for ITs",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-doi-service') {
      allow_update_branch: false,
      description: "Service for accepting a DOI and returning a Journal ID and Crossref metadata for the DOI",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-download-service') {
      allow_update_branch: false,
      description: "PASS manuscript download service",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-dupe-checker') {
      allow_update_branch: false,
      default_branch: "master",
      description: "Walks a Fedora repository of PASS resources, identifying duplicates and storing output in an SQLite database",
      has_issues: false,
      has_wiki: false,
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-ember-adapter') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Adapter that enables an ember application to interact with a Fedora repository",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-fcrepo-jms') {
      allow_update_branch: false,
      default_branch: "master",
      description: "JMS Addons for the Fedora Repository",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://issues.library.jhu.edu/rest/bitbucket/1.0/repository/137/sync') {
          events+: [
            "push"
          ],
        },
      ],
    },
    orgs.newRepo('pass-fcrepo-jsonld') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Addons for manipulating repository JSON-LD behaviour",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://issues.library.jhu.edu/rest/bitbucket/1.0/repository/127/sync') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-fcrepo-module-auth-rbacl') {
      allow_update_branch: false,
      default_branch: "master",
      description: "Role Based Authorization Delegate Module for the Fedora 4 Repository",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_issues: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('pass-grant-loader') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "This repo contains code that, when executed, will query institutional grant database for desired data and load it into local persistent storage",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-indexer') {
      allow_update_branch: false,
      description: "Contains code which keeps an Elasticsearch index up to date with resources in a Fedora repository.",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-indexer-checker') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-java-client') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Java client for managing interactions with the PASS data in Fedora",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-journal-loader') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "PASS Journal Loader",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-messaging-support') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Constants and utilities shared between deposit-services and notification-services.",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-metadata-schemas') {
      allow_update_branch: false,
      description: "repository for metadata schemas used by PASS ",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('pass-nihms-loader') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Service to retrieve Submission data from NIHMS, and update it in PASS",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-notification-services') {
      allow_update_branch: false,
      description: "Compose and dispatch notifications to users based on PASS events",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-package-providers') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Package Providers maintained by Johns Hopkins",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-policy-service') {
      allow_update_branch: false,
      description: "PASS policy service",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('pass-support') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('MAVEN_GPG_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('MAVEN_GPG_PASSPHRASE') {
          value: "********",
        },
        orgs.newRepoSecret('OSSRH_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('OSSRH_USERNAME') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('pass-test') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Test repository",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-ui') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "UI code base for PASS",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('pass-ui-public') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Static resources for the PASS UI to be deployed separately from pass-ember",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('playground') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Test repository",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('DIGITALOCEAN_ACCESS_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('GHCR_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('KUBE_CONFIG') {
          value: "********",
        },
        orgs.newRepoSecret('PASS_DOCKER_PAT') {
          value: "********",
        },
        orgs.newRepoSecret('TEST_SECRET') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('testing'),
      ],
    },
  ],
}
