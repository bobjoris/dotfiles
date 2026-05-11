function j --argument-names jdk
    set -l home (/usr/libexec/java_home -v $jdk 2>/dev/null)
    if test -z "$home"
        echo "JDK $jdk introuvable" >&2
        return 1
    end
    set -gx JAVA_HOME $home
    fish_add_path -gm $JAVA_HOME/bin
    java -version
end
