PY23_LIBRARY()

STYLE_PYTHON()

PY_SRCS(
    NAMESPACE build
    build_handler.py
    compilation_database.py
    dir_graph.py
    frepkage.py
    gen_plan2.py
    graph.py
    graph_path.py
    makefile.py
    targets_deref.py
    test_results_console_printer.py
    ya_make.py
)

PEERDIR(
    contrib/python/humanfriendly
    contrib/python/pyre2
    contrib/deprecated/python/ujson
    devtools/libs/parse_number/python
    devtools/libs/yaplatform/python
    devtools/ya/build/build_facade
    devtools/ya/build/build_opts
    devtools/ya/build/build_plan
    devtools/ya/build/build_result
    devtools/ya/build/ccgraph
    devtools/ya/build/evlog
    devtools/ya/build/gen_plan
    devtools/ya/build/genconf
    devtools/ya/build/makelist
    devtools/ya/build/owners
    devtools/ya/build/prefetch
    devtools/ya/build/reports
    devtools/ya/build/stat
    devtools/ya/build/targets
    devtools/ya/build/ymake2
    devtools/ya/core
    devtools/ya/exts
    devtools/ya/test/common
    devtools/ya/test/const
    devtools/ya/test/dartfile
    devtools/ya/test/dependency
    devtools/ya/test/explore
    devtools/ya/test/opts
    devtools/ya/test/test_node/coverage
    devtools/ya/yalibrary/debug_store
    devtools/ya/yalibrary/fetcher
    devtools/ya/yalibrary/graph
    devtools/ya/yalibrary/last_failed
    devtools/ya/yalibrary/monitoring
    devtools/ya/yalibrary/platform_matcher
    devtools/ya/yalibrary/runner
    devtools/ya/yalibrary/store
    devtools/ya/yalibrary/store/bazel_store
    devtools/ya/yalibrary/tools
    devtools/ya/yalibrary/toolscache
    devtools/ya/yalibrary/vcs
    devtools/ya/yalibrary/vcs/vcsversion
    devtools/ya/yalibrary/yandex/distbuild/distbs_consts
    devtools/ya/yalibrary/ya_helper/ya_utils
    library/python/cityhash
    library/python/compress
)

IF (NOT YA_OPENSOURCE)
    PEERDIR(
        devtools/ya/build/remote
        devtools/ya/build/source_package
        devtools/ya/yalibrary/build_graph_cache
        devtools/ya/yalibrary/checkout
        devtools/ya/yalibrary/diagnostics
        devtools/ya/yalibrary/streaming_client
        devtools/ya/yalibrary/yandex/distbuild
        devtools/ya/yalibrary/svn
        devtools/ya/yalibrary/upload
        # devtools/ya/yalibrary/store/yt_store # YA-938
    )
ENDIF()

END()

RECURSE(
    build_facade
    build_opts
    build_plan
    build_result
    ccgraph
    evlog
    gen_plan
    genconf
    makelist
    owners
    prefetch
    reports
    stat
    targets
    testlib
    ymake2
)

IF (NOT YA_OPENSOURCE)
    RECURSE(
        remote
        source_package
    )
ENDIF()

RECURSE_FOR_TESTS(
    tests
)
