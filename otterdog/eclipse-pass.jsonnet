local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.pass', 'eclipse-pass') {
  settings+: {
    description: "",
    name: "Eclipse Pass",
    packages_containers_internal: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('GH_PAT') {
      value: "pass:bots/technology.pass/github.com/api-token",
    },
    orgs.newOrgSecret('GH_USER') {
      value: "pass:bots/technology.pass/github.com/username",
    },
    orgs.newOrgSecret('MAVEN_GPG_KEY') {
      value: "pass:bots/technology.pass/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('MAVEN_GPG_PASSPHRASE') {
      value: "pass:bots/technology.pass/gpg/passphrase",
    },
    orgs.newOrgSecret('OSSRH_PASSWORD') {
      value: "pass:bots/technology.pass/central.sonatype.org/password",
    },
    orgs.newOrgSecret('OSSRH_USERNAME') {
      value: "pass:bots/technology.pass/central.sonatype.org/username",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
    },
    orgs.newRepo('eclipse-pass.github.io') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Catch all repository against which issues of general, cross cutting topics are logged.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
        orgs.newRepoSecret('JAVA_RELEASE_PAT') {
          value: "********",
        },
        orgs.newRepoSecret('MY_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/technology.pass/sonarcloud.io/token-main",
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "ModeShape is a distributed, hierarchical, transactional, and consistent data store with support for queries, full-text search, events, versioning, references, and flexible and dynamic schemas. It is very fast, highly available, extremely scalable, and it is 100% open source and written in Java.",
      has_issues: false,
      has_wiki: false,
      homepage: "http://www.modeshape.org",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-acceptance-testing') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-admin-ui') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Administrative UI code base for PASS",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-auth') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-authz') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Authorization helpers and user service",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('PASS_DOCKER_PAT') {
          value: "********",
        },
        orgs.newRepoSecret('PASS_DOCKER_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('PASS_DOCKER_USER') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/technology.pass/sonarcloud.io/token-pass-core",
        },
      ],
    },
    orgs.newRepo('pass-data-migration') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "initial",
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-data-model') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "The PASS data model",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('pass-deposit-services') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Deposit Services are responsible for the transfer of custodial content and metadata from end users to repositories.",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Developer-focused PASS runtime, which provides PASS and all of its dependent services using docker-compose.  Provides Docker images used for production deployment of PASS.",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-docker-mailserver') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "Provides SMTP and IMAP services for ITs",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-documentation') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "PASS Documentation",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pass-doi-service') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "Service for accepting a DOI and returning a Journal ID and Crossref metadata for the DOI",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "PASS manuscript download service",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-dupe-checker') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Walks a Fedora repository of PASS resources, identifying duplicates and storing output in an SQLite database",
      has_issues: false,
      has_wiki: false,
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-ember-adapter') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Adapter that enables an ember application to interact with a Fedora repository",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "JMS Addons for the Fedora Repository",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://issues.library.jhu.edu/rest/bitbucket/1.0/repository/137/sync') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request",
            "pull_request_review_comment",
            "push"
          ],
        },
      ],
    },
    orgs.newRepo('pass-fcrepo-jsonld') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Addons for manipulating repository JSON-LD behaviour",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://issues.library.jhu.edu/rest/bitbucket/1.0/repository/127/sync') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request",
            "pull_request_review_comment",
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Role Based Authorization Delegate Module for the Fedora 4 Repository",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_issues: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('pass-grant-loader') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "This repo contains code that, when executed, will query institutional grant database for desired data and load it into local persistent storage",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "Contains code which keeps an Elasticsearch index up to date with resources in a Fedora repository.",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-java-client') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Java client for managing interactions with the PASS data in Fedora",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "PASS Journal Loader",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-messaging-support') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Constants and utilities shared between deposit-services and notification-services.",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "repository for metadata schemas used by PASS ",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Service to retrieve Submission data from NIHMS, and update it in PASS",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "Compose and dispatch notifications to users based on PASS events",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Package Providers maintained by Johns Hopkins",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "PASS policy service",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('pass-support') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/technology.pass/sonarcloud.io/token-pass-support",
        },
      ],
    },
    orgs.newRepo('pass-test') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "Test repository",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('pass-ui') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "UI code base for PASS",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Static resources for the PASS UI to be deployed separately from pass-ember",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('playground') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Test repository",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
