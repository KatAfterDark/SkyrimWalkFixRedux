-- xmake port of the CMake build, targeting the 1.7-capable CommonLibSSE-NG
set_xmakever("3.0.5")

includes(os.getenv("CommonLibSSE-NG"))

set_project("WalkFixRedux")
set_version("1.0.0")
set_license("MIT")

set_languages("c++23")
set_warnings("allextra")
set_defaultmode("releasedbg")

add_rules("mode.debug", "mode.releasedbg")

set_config("skyrim_vr", false)

add_requires("polyhook2")

target("WalkFixRedux")
    add_deps("commonlibsse-ng")
    add_packages("polyhook2")

    add_rules("commonlibsse-ng.plugin", {
        name = "WalkFixRedux",
        author = "awdavies",
        description = "Fixes 3rd person walk/run animation speed mismatch"
    })

    add_files("src/**.cpp")
    add_headerfiles("src/**.h")
    add_includedirs("src", "xmake-gen")
    set_pcxxheader("src/PCH.h")
