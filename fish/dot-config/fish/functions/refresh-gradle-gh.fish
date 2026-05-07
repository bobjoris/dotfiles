function refresh-gradle-gh
    set -l token (gh auth token)
    set -l user (gh api user --jq .login)

    if test -z "$token"
        echo "❌ Pas de token gh disponible. Lance 'gh auth login'."
        return 1
    end

    set -l props_file ~/.gradle/gradle.properties
    mkdir -p ~/.gradle

    if test -f $props_file
        grep -v "^github\." $props_file > $props_file.tmp
        mv $props_file.tmp $props_file
    end

    echo "github.username=$user" >> $props_file
    echo "github.token=$token" >> $props_file

    chmod 600 $props_file
    echo "✅ gradle.properties mis à jour pour $user"
end
