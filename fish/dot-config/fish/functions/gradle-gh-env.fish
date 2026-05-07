function gradle-gh-env --description 'Inject GitHub credentials into Gradle env vars (no disk write)'
    if not command -q gh
        return 1
    end

    set -l token (gh auth token 2>/dev/null)
    if test -z "$token"
        return 1
    end

    if test -z "$GRADLE_GH_USER"
        set -l user (gh api user --jq .login 2>/dev/null)
        test -n "$user"; and set -U GRADLE_GH_USER "$user"
    end

    set -gx ORG_GRADLE_PROJECT_githubUsername "$GRADLE_GH_USER"
    set -gx ORG_GRADLE_PROJECT_githubToken "$token"
end
