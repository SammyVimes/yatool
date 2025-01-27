PY3_LIBRARY(ya-lib)

SRCDIR(devtools/ya)

PEERDIR(
    devtools/ya/handlers/buf
    devtools/ya/handlers/dump
    devtools/ya/handlers/gc
    devtools/ya/handlers/gen_config
    devtools/ya/handlers/ide
    devtools/ya/handlers/java
    devtools/ya/handlers/krevedko
    devtools/ya/handlers/make
    devtools/ya/handlers/maven_import
    devtools/ya/handlers/package
    devtools/ya/handlers/py
    devtools/ya/handlers/style
    devtools/ya/handlers/test
    devtools/ya/handlers/tool
)

IF (PYTHON3)
    PEERDIR(
        devtools/ya/handlers/analyze_make
    )
ENDIF()

IF (NOT YA_OPENSOURCE)
    PEERDIR(
        devtools/ya/handlers/__trace__
        devtools/ya/handlers/addremove
        devtools/ya/handlers/clang_tidy
        devtools/ya/handlers/clone
        devtools/ya/handlers/completion
        devtools/ya/handlers/dctl
        devtools/ya/handlers/download
        # devtools/ya/handlers/exec
        # devtools/ya/handlers/fetch
        devtools/ya/handlers/fix_includes
        devtools/ya/handlers/notify
        devtools/ya/handlers/paste
        devtools/ya/handlers/pr
        devtools/ya/handlers/profile
        devtools/ya/handlers/project
        # devtools/ya/handlers/remote_gdb
        # devtools/ya/handlers/repo_check
        # devtools/ya/handlers/shell
        # devtools/ya/handlers/stat
        devtools/ya/handlers/svn
        devtools/ya/handlers/upload
        devtools/ya/handlers/vmctl
        # devtools/ya/handlers/webide
        devtools/ya/handlers/whoami
        devtools/ya/handlers/wine
        devtools/ya/handlers/yav
        devtools/ya/handlers/py23migration/_ya0bin2
        devtools/ya/handlers/py23migration/_ya0bin3
        devtools/ya/handlers/py23migration/_ya2bin0
        devtools/ya/handlers/py23migration/_ya2bin2
        devtools/ya/handlers/py23migration/_ya3bin0
        devtools/ya/handlers/py23migration/_ya3bin3
    )
    IF (PYTHON3)
        PEERDIR(
            devtools/ya/handlers/py23migration/py23_utils
            devtools/ya/handlers/vim
            devtools/ya/handlers/curl
            devtools/ya/handlers/neovim
            devtools/ya/handlers/gdb
            devtools/ya/handlers/emacs
            devtools/ya/handlers/grep
            devtools/ya/handlers/jstyle
            devtools/ya/handlers/nile
            devtools/ya/handlers/run
            devtools/ya/handlers/sed
            devtools/ya/handlers/ydb
            devtools/ya/handlers/yql
        )
    ENDIF()
ENDIF()

END()

RECURSE(
    __trace__
    addremove
    analyze_make
    autocheck
    buf
    clang_tidy
    clone
    completion
    curl
    dctl
    download
    dump
    emacs
    # exec
    # fetch
    fix_includes
    gc
    gdb
    gen_config
    grep
    ide
    java
    jstyle
    krevedko
    make
    maven_import
    neovim
    nile
    notify
    package
    paste
    pr
    profile
    project
    py
    # remote_gdb
    # repo_check
    run
    sed
    # shell
    # stat
    style
    svn
    test
    tool
    upload
    vim
    vmctl
    # webide
    whoami
    wine
    yav
    ydb
    yql
)

IF (NOT OPENSOURCE)
    RECURSE(
        py23migration/_ya0bin2
        py23migration/_ya0bin3
        py23migration/_ya2bin0
        py23migration/_ya3bin0
        py23migration/_ya3bin3
        py23migration/_ya2bin2
        py23migration/py23_utils
    )
ENDIF()
