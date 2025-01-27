LIBRARY()

USE_PYTHON3()

PEERDIR(
    contrib/libs/yaml-cpp
    contrib/python/PyYAML
    contrib/python/python-rapidjson
    contrib/python/six
    contrib/libs/fmt
    contrib/libs/re2
    devtools/draft
    devtools/common/blacklist
    devtools/libs/yaplatform
    devtools/ymake/all_srcs
    devtools/ymake/common
    devtools/ymake/compact_graph
    devtools/ymake/diag
    devtools/ymake/include_parsers
    devtools/ymake/lang
    devtools/ymake/lang/makelists
    devtools/ymake/make_plan
    devtools/ymake/options
    devtools/ymake/resolver
    devtools/ymake/symbols
    devtools/ymake/yndex
    library/cpp/blockcodecs
    library/cpp/containers/absl_flat_hash
    library/cpp/containers/top_keeper
    library/cpp/string_utils/levenshtein_diff
    library/cpp/deprecated/autoarray
    library/cpp/deprecated/split
    library/cpp/digest/md5
    library/cpp/getopt/small
    library/cpp/iterator
    library/cpp/json
    library/cpp/json/writer
    library/cpp/on_disk/multi_blob
    library/cpp/pybind
    library/cpp/regex/pcre
    library/cpp/resource
    library/cpp/sighandler
    library/cpp/string_utils/base64
    library/cpp/svnversion
    library/cpp/ucompress
    library/cpp/zipatch
)

IF (MSVC)
    # default flags are good
ELSE()
    SET(RAGEL6_FLAGS -lF1)
ENDIF()

SRCS(
    add_dep_adaptor.cpp
    add_iter_debug.cpp
    add_iter.cpp
    add_node_context.cpp
    addincls.cpp
    args_converter.cpp
    blacklist.cpp
    cmd_properties.cpp
    command_helpers.cpp
    command_store.cpp
    commands/function_evaluator.cpp
    commands/script_evaluator.cpp
    conf.cpp
    config/config.cpp
    debug_log.cpp
    dependency_management.cpp
    diag_reporter.cpp
    dirs.cpp
    dump_owners.cpp
    exec.cpp
    export_json_debug.cpp
    export_json.cpp
    flat_json_graph.cpp
    general_parser.cpp
    global_vars_collector.cpp
    graph_changes_predictor.cpp
    incl_fixer.cpp
    include_processors/base.cpp
    include_processors/cfgproto_processor.cpp
    include_processors/cpp_processor.cpp
    include_processors/cython_processor.cpp
    include_processors/flatc_processor.cpp
    include_processors/fortran_processor.cpp
    include_processors/go_processor.cpp
    include_processors/gzt_processor.cpp
    include_processors/include.cpp
    include_processors/lex_processor.cpp
    include_processors/mapkit_idl_processor.cpp
    include_processors/nlg_processor.cpp
    include_processors/parsers_cache.cpp
    include_processors/proto_processor.cpp
    include_processors/ragel_processor.cpp
    include_processors/ros_processor.cpp
    include_processors/swig_processor.cpp
    include_processors/ts_processor.cpp
    include_processors/xs_processor.cpp
    include_processors/ydl_processor.cpp
    induced_props_debug.cpp
    induced_props.cpp
    isolated_projects.cpp
    json_entry_stats.cpp
    json_md5.cpp
    json_subst.cpp
    json_visitor_new.cpp
    json_visitor.cpp
    lang/plugin_facade.cpp # XXX
    licenses_conf.cpp
    list_modules.cpp
    macro_processor.cpp
    macro_string.cpp
    macro.cpp
    main.cpp
    make_plan_cache.cpp
    makefile_loader.cpp
    managed_deps_iter.cpp
    md5_debug.cpp
    mine_variables.cpp
    mkcmd.cpp
    module_add_data.cpp
    module_builder.cpp
    module_confs.cpp
    module_dir.cpp
    module_loader.cpp
    module_resolver.cpp
    module_restorer.cpp
    module_state.cpp
    module_store.cpp
    module_wrapper.cpp
    node_builder.cpp
    node_printer.cpp
    out.cpp
    parser_manager.cpp
    path_matcher.cpp
    peers_rules.cpp
    peers.cpp
    plugins/cmd_context_class.cpp
    plugins/context_class.cpp
    plugins/cpp_plugins.cpp
    plugins/error.cpp
    plugins/init.cpp
    plugins/plugin_go_fake_output_handler.cpp
    plugins/plugin_macro_impl.cpp
    plugins/plugin_resource_handler.cpp
    plugins/pyinit.pyx
    plugins/ymake_module_adapter.cpp
    plugins/ymake.pyx
    propagate_change_flags.cpp
    recurse_graph.cpp
    run_main.cpp
    run_python.cpp
    saveload.cpp
    sem_graph.cpp
    shell_subst.cpp
    spdx.cpp
    sysincl_conf.cpp
    sysincl_resolver.cpp
    tools_miner.cpp
    trace_start.cpp
    transitive_constraints.cpp
    transitive_requirements_check.cpp
    transitive_state.cpp
    vars.cpp
    ymake.cpp
)

IF (OPENSOURCE)
    SRCS(
        dummy_msvs.cpp
    )
ELSE()
    SRCS(
        msvs.cpp
        msvs/command.cpp
        msvs/configuration.cpp
        msvs/file.cpp
        msvs/guid.cpp
        msvs/module.cpp
        msvs/obj.cpp
        msvs/project.cpp
        msvs/project_tree.cpp
        msvs/query.cpp
        msvs/vcxproj.cpp
        msvs/version.cpp
    )
    PEERDIR(
        devtools/msvs
        library/cpp/xml/document
    )
ENDIF()

IF(NEW_UIDS_BY_DEFAULT)
    CFLAGS(GLOBAL -DNEW_UIDS_BY_DEFAULT)
ENDIF()

IF(NEW_UID_COMPARE)
    CFLAGS(GLOBAL -DNEW_UID_COMPARE)
ENDIF()

IF(UIDS_CACHE_ENABLED)
    CFLAGS(GLOBAL -DUIDS_CACHE_ENABLED)
ENDIF()

GENERATE_ENUM_SERIALIZATION(add_iter_debug.h)
GENERATE_ENUM_SERIALIZATION(config/config.h)
GENERATE_ENUM_SERIALIZATION(export_json_debug.h)
GENERATE_ENUM_SERIALIZATION(include_processors/include.h)
GENERATE_ENUM_SERIALIZATION(induced_props.h)
GENERATE_ENUM_SERIALIZATION(module_resolver.h)
GENERATE_ENUM_SERIALIZATION(module_state.h)
GENERATE_ENUM_SERIALIZATION(peers_rules.h)

RESOURCE(
    msvs/proj.xml proj.xml
    msvs/all_proj.xml all_proj.xml
)

PY_REGISTER(ymake)

END()

RECURSE(
    bin
    common
    compact_graph
    diag
    lang
    lang/expansion_fuzz
    lang/confreader_fuzz
    options
    polexpr
    resolver
    stub
    symbols
    tools
    yndex
)

RECURSE_FOR_TESTS(
    common/ut
    compact_graph/perf
    compact_graph/ut
    include_parsers/ut
    include_processors/ut
    lang/makelists/fuzz
    lang/makelists/ut
    resolver/ut
    symbols/ut
    ut
    ut/hexencoder
)

IF (NOT OPENSOURCE)
    RECURSE(
        msvs/ut
    )
ENDIF()

IF (OS_WINDOWS OR YA_OPENSOURCE OR OPENSOURCE)
    # This excludes integrational tests, but leaves unit tests
    # For OpenSource some tests will be re-added back, but definitely not all
ELSE()
    RECURSE(
        tests
    )
ENDIF()
